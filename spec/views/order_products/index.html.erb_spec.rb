require 'rails_helper'

RSpec.describe "order_products/index", type: :view do
  before(:each) do
    assign(:order_products, [
      OrderProduct.create!(
        product: nil,
        order: nil,
        quantity: 2
      ),
      OrderProduct.create!(
        product: nil,
        order: nil,
        quantity: 2
      )
    ])
  end

  it "renders a list of order_products" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
