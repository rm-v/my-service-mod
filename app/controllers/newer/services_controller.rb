class Newer::ServicesController < ApplicationController
  def summary
  end

  def history
  end

  def statistics
  end
  
  
  def show
    @service = Service.find params[:id]
  end
  
end
