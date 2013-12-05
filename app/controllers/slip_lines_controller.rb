class SlipLinesController < ApplicationController
  # GET /slip_lines
  # GET /slip_lines.json
  def index
    @slip_lines = SlipLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slip_lines }
    end
  end

  # GET /slip_lines/1
  # GET /slip_lines/1.json
  def show
    @slip_line = SlipLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slip_line }
    end
  end

  # GET /slip_lines/new
  # GET /slip_lines/new.json
  def new
    @slip_line = SlipLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slip_line }
    end
  end

  # GET /slip_lines/1/edit
  def edit
    @slip_line = SlipLine.find(params[:id])
  end

  # POST /slip_lines
  # POST /slip_lines.json
  def create
    @slip_line = SlipLine.new(params[:slip_line])

    respond_to do |format|
      if @slip_line.save
        format.html { redirect_to @slip_line, notice: 'Slip line was successfully created.' }
        format.json { render json: @slip_line, status: :created, location: @slip_line }
      else
        format.html { render action: "new" }
        format.json { render json: @slip_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slip_lines/1
  # PUT /slip_lines/1.json
  def update
    @slip_line = SlipLine.find(params[:id])

    respond_to do |format|
      if @slip_line.update_attributes(params[:slip_line])
        format.html { redirect_to @slip_line, notice: 'Slip line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slip_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slip_lines/1
  # DELETE /slip_lines/1.json
  def destroy
    @slip_line = SlipLine.find(params[:id])
    @slip_line.destroy

    respond_to do |format|
      format.html { redirect_to slip_lines_url }
      format.json { head :no_content }
    end
  end
end
