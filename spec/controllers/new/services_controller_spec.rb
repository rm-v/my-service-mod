require 'spec_helper'

describe New::ServicesController do

  describe "GET 'summary'" do
    it "returns http success" do
      get 'summary'
      response.should be_success
    end
  end

  describe "GET 'history'" do
    it "returns http success" do
      get 'history'
      response.should be_success
    end
  end

  describe "GET 'statistics'" do
    it "returns http success" do
      get 'statistics'
      response.should be_success
    end
  end

end
