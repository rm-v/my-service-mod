/**Printer server module for versum.com
 */
 var versumPrinter = (function() {

     var slipSource;        //module variable, contains EventSource sending slips to print
     var poolingActivated;   //pooling state, false or true
     var periodicalUpdater; //pooling object, "singleton" kind of

     return {
        /**
         * Start periodically asking server for new objects to print.
         * @param {string}
         *
         */
        startListeningForSlipsToPrint: function(data_source_url, params) {
            if (typeof periodicalUpdater === "undefined") {
                console.log("creating PeriodicalUpdater");
                periodicalUpdater = $.PeriodicalUpdater(data_source_url, {
                    method: 'get',
                    data: params,
                    minTimeout: 10000,
                    maxTimeout: 10000,
                    multiplier: 1,
                    type: 'text',
                    maxCalls: 0,
                    autoStop: 0,
                    verbose: 1
                    },
                    function(data, success, xhr, handle) {
                        console.log("message pooled from: " + data_source_url);
                        console.log("received msg: " + JSON.stringify(data, null, " ") );
                        versumPrinter.decodeAndPrintSlip(data);
//                        versumPrinter.decodeAndPrintSlip( '{"cashbox" : "XX99",'+
//
//'                            "cashierName" : "Rafał ąćęłńóśźż",'+
//'                            "created" : 1377262368237,'+
//'                            "errorNote" : "Nowy",'+
//'                            "printingState" : "Created",'+
//'                            "reference" : "R-k 0123456789",'+
//'                            "slipLines" : ['+
//'                                { "amount" : 1,'+
//'                                    "discount" : 0,'+
//'                                    "discountType" : "NoDiscount",'+
//'                                    "name" : "Test drukarki",'+
//'                                    "price" : 0.01,'+
//'                                    "taxRate" : "VAT23"'+
//'                                } ],'+
//'                            "slipPayments" : [ { "amount" : 0.01,'+
//'                                "type" : "Cash"'+
//'                            } ]'+
//'                        }' );


                        //update_events_if_neccessary(data.last_event_update);
                });
                poolingActivated = true;
            }else{
                console.log("restarting PeriodicalUpdater");
                periodicalUpdater.restart();
                poolingActivated = true;
            }
        },

        stopListeningForSlipsToPrint: function(){
            console.log("stoping PeriodicalUpdater")
            if(poolingActivated){
                if(typeof periodicalUpdater !== "undefined" ){
                    periodicalUpdater.stop();
                    poolingActivated = false;
                }
            }
        },


        /**
         * Gets Slip as JSON string or in s.data, sends it to printer applet and prints it.
         * @param {type} s String or event from EventSource containing JSON string in s.data
         * @returns {Boolean} true if successfull false otherwise
         */
        decodeAndPrintSlip: function(s) {
            var json_slip = "";
            if (s.type !== "undefined" && s.type === "message") { //s is an event, should contain JSON slip
                json_slip = s.data;
            }
            else if (typeof(s) == "string") { //JSON string with slip
                json_slip = s;
            }
            else {
                return false;
            }

            //TODO: error handling (results from applet) and sending printing status back to web server
            versumPrinter.addSlipToQueue(s);
            versumPrinter.printAll();
        },

        /**
         * Add slip encoded as JSON string to internal applet print queue.
         * @param {type} slip
         * @returns {undefined}
         */
        addSlipToQueue: function (slip) {
            console.log("in versumPrinter.addSlipToQueue");
            //$("#PrintingServerApplet")[0].test("trying to add slip to queue");
            $("#PrintingServerApplet")[0].addSlipToQueue(slip)
        },


        printAll: function() {
            console.log("in versumPrinter.printAll()");
            $("#PrintingServerApplet")[0].printAllQueue();
            //document.PrintingServerApplet.print();
            //$("#PrintingServerApplet")[0].print();
            //document.applets[0].PrintingServerApplet.print();
        },


        savePrinterConfiguration: function() {
            var driver = $("#driver").val();
            var port = $("#port").val();
            $("#PrintingServerApplet")[0].setSerialPort(port);
            $("#PrintingServerApplet")[0].setFiscalPrinterType(driver);
        },



        /**
         * For manual testing.
         * Adds slip (JSON) from combo (#slip-url) in webpage to print queue of applet and prints it.
         *
         */
        addAndPrintSlip: function() {
            var slip_url = $("#slip-url").val();
            var applet = $("#PrintingServerApplet")[0];
            $.getJSON(slip_url, function(data){
                var as_str = JSON.stringify(data, null, "  ")
                applet.addSlipToQueue(as_str);
                applet.printAllQueue();
            });
        },

        /**
         * For manual testing.
         * Just calls applet function which creates and prints test slips.
         */
        testQueuePrinting: function() {
            $("#PrintingServerApplet")[0].printParagonTestQueue();
        },

        /**
         * Can be used to get test Slips generated by Slip class from print server as JSON string.
         * This string from applet is outputed in <div> element
         */
        getTestSlipsAsJson: function() {
            var out = $("#PrintingServerApplet")[0].getTestSlipsAsJson();
            $('#jsonoutput>ul').append('<li>' + out + "</li>");
        },


        /**
         * Use it to test communication with applet.
         * @param message string to send to test function in applet. Will be outputed in message box from applet.
         */
        testApplet: function (message){
            $("#PrintingServerApplet")[0].test(message);
            //TODO: exception handling,
            //if user didn't allowed access to applet we will get exception here
            console.log("test(" +message+ ") called.");
        }
    };
 })();