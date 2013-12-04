#encoding: utf-8
class StaticPagesController < ApplicationController
   helper_method :all

  def home
  end
  
  def print_test
    @time = Time.current
    respond_to do |format|
      format.html # show.html.erb
      format.json do render json: if params[:roundRobin]
                                    testRoundRobin
                                  else
                                      testSlip
                                  end
      end
    end
  end
  
  def initialize
    super
      @test_slips = {oneCentSlip: %q{{"cashbox" : "XX99",
                                      "cashierName" : "Rafał ąćęłńóśźż",
                                      "created" : 1377262368237,
                                      "errorNote" : "Nowy",
                                      "printingState" : "Created",
                                      "reference" : "R-k 0123456789",
                                      "slipLines" : [
                                          { "amount" : 1,
                                            "discount" : 0,
                                            "discountType" : "NoDiscount",
                                            "name" : "Test drukarki",
                                            "price" : 0.01,
                                            "taxRate" : "VAT23"
                                          } ],
                                      "slipPayments" : [ { "amount" : 0.01,
                                            "type" : "Cash"
                                          } ]
                                    }
                    },

                    noDiscountSlip: %q{{"cashbox" : "XX99",
                                        "cashierName" : "Rafał ąćęłńóśźż",
                                        "created" : 1377265000914,
                                        "errorNote" : "Nowy",
                                        "printingState" : "Created",
                                        "reference" : "R-k 0123456789",
                                        "slipLines" : [ { "amount" : 1,
                                              "discount" : 0,
                                              "discountType" : "NoDiscount",
                                              "name" : "Test drukarki",
                                              "price" : 0.01,
                                              "taxRate" : "VAT23"
                                            } ],
                                        "slipPayments" : [ { "amount" : 0.01,
                                              "type" : "Cash"
                                            } ]
                                       }
                    }
    } 
  end
  
  def testSlip
    slip = params[:slip]
    if slip.respond_to? :to_sym
      slip = slip.to_sym
    else
      return "{}"
    end
    slip_json = @test_slips[slip]
    slip_json ? slip_json : "{}"
  end

  def testRoundRobin
    Rails.logger.debug session.inspect
    call_count = session[:testRoundRobin_call_count] || 0
    if call_count % 2 == 0
      call_count += 1
      session[:testRoundRobin_call_count] = call_count
      @test_slips[:oneCentSlip]
    else
      call_count += 1
      session[:testRoundRobin_call_count] = call_count
      @test_slips[:noDiscountSlip]
    end
  end

end
