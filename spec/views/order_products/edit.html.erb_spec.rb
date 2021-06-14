require 'rails_helper'

RSpec.describe "order_products/edit", type: :view do
  before(:each) do
    @order_product = assign(:order_product, OrderProduct.create!(
      product: nil,
      order: nil,
      quantity: 1
    ))
  end

  it "renders the edit order_product form" do
    render

    assert_select "form[action=?][method=?]", order_product_path(@order_product), "post" do

      assert_select "input[name=?]", "order_product[product_id]"

      assert_select "input[name=?]", "order_product[order_id]"

      assert_select "input[name=?]", "order_product[quantity]"
    end
  end
end
