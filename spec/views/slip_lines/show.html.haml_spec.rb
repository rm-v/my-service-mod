require 'spec_helper'

describe "slip_lines/show" do
  before(:each) do
    @slip_line = assign(:slip_line, stub_model(SlipLine,
      :amount => "9.99",
      :discount => "9.99",
      :discount_type => "Discount Type",
      :name => "Name",
      :price => "9.99",
      :tax_rate => "Tax Rate"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/Discount Type/)
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/Tax Rate/)
  end
end
