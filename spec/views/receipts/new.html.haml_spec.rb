require 'spec_helper'

describe "receipts/new" do
  before(:each) do
    assign(:receipt, stub_model(Receipt,
      :cashbox => "MyString",
      :cashier_name => "MyString",
      :error_note => "MyString",
      :printing_state => "MyString",
      :reference => "MyString",
      :branch_id => 1
    ).as_new_record)
  end

  it "renders new receipt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receipts_path, "post" do
      assert_select "input#receipt_cashbox[name=?]", "receipt[cashbox]"
      assert_select "input#receipt_cashier_name[name=?]", "receipt[cashier_name]"
      assert_select "input#receipt_error_note[name=?]", "receipt[error_note]"
      assert_select "input#receipt_printing_state[name=?]", "receipt[printing_state]"
      assert_select "input#receipt_reference[name=?]", "receipt[reference]"
      assert_select "input#receipt_branch_id[name=?]", "receipt[branch_id]"
    end
  end
end
