require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyText",
      brand: nil,
      category: nil,
      image_url: "MyText",
      for: "MyText",
      desc1: "MyText",
      desc2: "MyText"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "textarea[name=?]", "product[name]"

      assert_select "input[name=?]", "product[brand_id]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "textarea[name=?]", "product[image_url]"

      assert_select "textarea[name=?]", "product[for]"

      assert_select "textarea[name=?]", "product[desc1]"

      assert_select "textarea[name=?]", "product[desc2]"
    end
  end
end
