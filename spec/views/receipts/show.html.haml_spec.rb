require 'spec_helper'

describe "receipts/show" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt,
      :cashbox => "Cashbox",
      :cashier_name => "Cashier Name",
      :error_note => "Error Note",
      :printing_state => "Printing State",
      :reference => "Reference",
      :branch_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cashbox/)
    rendered.should match(/Cashier Name/)
    rendered.should match(/Error Note/)
    rendered.should match(/Printing State/)
    rendered.should match(/Reference/)
    rendered.should match(/1/)
  end
end
