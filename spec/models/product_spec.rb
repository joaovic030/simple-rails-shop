require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  it { expect(product).to be_valid }

  context 'is not valid when' do
    it { expect(build(:product, category: nil)).to_not be_valid }
    it { expect(build(:product, brand: nil)).to_not be_valid }
    it { expect(build(:product, name: nil)).to_not be_valid }
    it { expect(build(:product, price: nil)).to_not be_valid }
    it { expect(build(:product, for: nil)).to_not be_valid }
    it { expect(build(:product, image_url: nil)).to_not be_valid }
    it { expect(build(:product, desc1: nil)).to_not be_valid }
    it { expect(build(:product, desc2: nil)).to_not be_valid }
  end

  it 'belongs to a brand' do
    expect(product.brand).to be_kind_of(Brand)
  end

  it 'belongs to a category' do
    expect(product.category).to be_kind_of(Category)
  end

  it 'is valid when image_url matchs' do
    expect(product.image_url).to match(/https?:\/\/[\S]+/)
  end
end
