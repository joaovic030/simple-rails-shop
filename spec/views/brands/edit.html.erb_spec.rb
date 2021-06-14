require 'rails_helper'

RSpec.describe "brands/edit", type: :view do
  before(:each) do
    @brand = assign(:brand, Brand.create!(
      name: "MyText"
    ))
  end

  it "renders the edit brand form" do
    render

    assert_select "form[action=?][method=?]", brand_path(@brand), "post" do

      assert_select "textarea[name=?]", "brand[name]"
    end
  end
end
