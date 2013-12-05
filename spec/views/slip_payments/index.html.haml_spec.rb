require 'spec_helper'

describe "slip_payments/index" do
  before(:each) do
    assign(:slip_payments, [
      stub_model(SlipPayment,
        :amount => "9.99",
        :name => "Name",
        :type => "Type",
        :receipt_id => 1
      ),
      stub_model(SlipPayment,
        :amount => "9.99",
        :name => "Name",
        :type => "Type",
        :receipt_id => 1
      )
    ])
  end

  it "renders a list of slip_payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
