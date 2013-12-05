require 'spec_helper'

describe "slip_lines/index" do
  before(:each) do
    assign(:slip_lines, [
      stub_model(SlipLine,
        :amount => "9.99",
        :discount => "9.99",
        :discount_type => "Discount Type",
        :name => "Name",
        :price => "9.99",
        :tax_rate => "Tax Rate"
      ),
      stub_model(SlipLine,
        :amount => "9.99",
        :discount => "9.99",
        :discount_type => "Discount Type",
        :name => "Name",
        :price => "9.99",
        :tax_rate => "Tax Rate"
      )
    ])
  end

  it "renders a list of slip_lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Discount Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Tax Rate".to_s, :count => 2
  end
end
