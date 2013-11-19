require 'spec_helper'

describe "Users ->" do
  describe "GET /users:" do
    it "works! view exists" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_index_path
      response.status.should be(200)
    end
    
    it "exists (second sample test)" do
      get users_index_path
      response.status.should be(200)
    end
  end
end
