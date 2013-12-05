class SlipPaymentsController < ApplicationController
  # GET /slip_payments
  # GET /slip_payments.json
  def index
    @slip_payments = SlipPayment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slip_payments }
    end
  end

  # GET /slip_payments/1
  # GET /slip_payments/1.json
  def show
    @slip_payment = SlipPayment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slip_payment }
    end
  end

  # GET /slip_payments/new
  # GET /slip_payments/new.json
  def new
    @slip_payment = SlipPayment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slip_payment }
    end
  end

  # GET /slip_payments/1/edit
  def edit
    @slip_payment = SlipPayment.find(params[:id])
  end

  # POST /slip_payments
  # POST /slip_payments.json
  def create
    @slip_payment = SlipPayment.new(params[:slip_payment])

    respond_to do |format|
      if @slip_payment.save
        format.html { redirect_to @slip_payment, notice: 'Slip payment was successfully created.' }
        format.json { render json: @slip_payment, status: :created, location: @slip_payment }
      else
        format.html { render action: "new" }
        format.json { render json: @slip_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slip_payments/1
  # PUT /slip_payments/1.json
  def update
    @slip_payment = SlipPayment.find(params[:id])

    respond_to do |format|
      if @slip_payment.update_attributes(params[:slip_payment])
        format.html { redirect_to @slip_payment, notice: 'Slip payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slip_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slip_payments/1
  # DELETE /slip_payments/1.json
  def destroy
    @slip_payment = SlipPayment.find(params[:id])
    @slip_payment.destroy

    respond_to do |format|
      format.html { redirect_to slip_payments_url }
      format.json { head :no_content }
    end
  end
end
