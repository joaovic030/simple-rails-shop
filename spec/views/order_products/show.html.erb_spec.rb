require 'rails_helper'

RSpec.describe "order_products/show", type: :view do
  before(:each) do
    @order_product = assign(:order_product, OrderProduct.create!(
      product: nil,
      order: nil,
      quantity: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
