require 'spec_helper'

describe "receipts/index" do
  before(:each) do
    assign(:receipts, [
      stub_model(Receipt,
        :cashbox => "Cashbox",
        :cashier_name => "Cashier Name",
        :error_note => "Error Note",
        :printing_state => "Printing State",
        :reference => "Reference",
        :branch_id => 1
      ),
      stub_model(Receipt,
        :cashbox => "Cashbox",
        :cashier_name => "Cashier Name",
        :error_note => "Error Note",
        :printing_state => "Printing State",
        :reference => "Reference",
        :branch_id => 1
      )
    ])
  end

  it "renders a list of receipts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cashbox".to_s, :count => 2
    assert_select "tr>td", :text => "Cashier Name".to_s, :count => 2
    assert_select "tr>td", :text => "Error Note".to_s, :count => 2
    assert_select "tr>td", :text => "Printing State".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
