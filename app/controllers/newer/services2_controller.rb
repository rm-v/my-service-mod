class Newer::Services2Controller < ApplicationController
  
  #TODO
  def summary
  end

  #TODO
  def history
  end

  #TODO
  def statistics
  end
  
  #TODO
  def show
    @service = Service.find params[:id]
  end
end
