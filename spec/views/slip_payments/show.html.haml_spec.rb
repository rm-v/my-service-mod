require 'spec_helper'

describe "slip_payments/show" do
  before(:each) do
    @slip_payment = assign(:slip_payment, stub_model(SlipPayment,
      :amount => "9.99",
      :name => "Name",
      :type => "Type",
      :receipt_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/1/)
  end
end
