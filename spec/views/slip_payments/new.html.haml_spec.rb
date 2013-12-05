require 'spec_helper'

describe "slip_payments/new" do
  before(:each) do
    assign(:slip_payment, stub_model(SlipPayment,
      :amount => "9.99",
      :name => "MyString",
      :type => "",
      :receipt_id => 1
    ).as_new_record)
  end

  it "renders new slip_payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", slip_payments_path, "post" do
      assert_select "input#slip_payment_amount[name=?]", "slip_payment[amount]"
      assert_select "input#slip_payment_name[name=?]", "slip_payment[name]"
      assert_select "input#slip_payment_type[name=?]", "slip_payment[type]"
      assert_select "input#slip_payment_receipt_id[name=?]", "slip_payment[receipt_id]"
    end
  end
end
