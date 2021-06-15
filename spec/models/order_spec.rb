require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }
  
  it { expect(order).to be_valid }

  it 'is valid when contains order_products' do
    expect(create(:order_with_products).order_products.length).to be >= 1
  end

  context 'when one of those is missing' do
    it { expect(build(:order, total_price: nil)).to_not be_valid }
    it { expect(build(:order_with_products, user: nil)).to_not be_valid }
  end

  it 'is invalid when order has no products' do
    expect(create(:order_without_products).order_products.length).to eql(0)
  end


end
