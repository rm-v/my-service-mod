require 'spec_helper'

describe "slip_lines/new" do
  before(:each) do
    assign(:slip_line, stub_model(SlipLine,
      :amount => "9.99",
      :discount => "9.99",
      :discount_type => "MyString",
      :name => "MyString",
      :price => "9.99",
      :tax_rate => "MyString"
    ).as_new_record)
  end

  it "renders new slip_line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", slip_lines_path, "post" do
      assert_select "input#slip_line_amount[name=?]", "slip_line[amount]"
      assert_select "input#slip_line_discount[name=?]", "slip_line[discount]"
      assert_select "input#slip_line_discount_type[name=?]", "slip_line[discount_type]"
      assert_select "input#slip_line_name[name=?]", "slip_line[name]"
      assert_select "input#slip_line_price[name=?]", "slip_line[price]"
      assert_select "input#slip_line_tax_rate[name=?]", "slip_line[tax_rate]"
    end
  end
end
