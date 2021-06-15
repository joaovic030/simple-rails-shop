require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:order_product) { create(:order_product) }

  it { expect(order_product).to be_valid }

  it 'is invalid when has no order' do
    expect(build(:order_product, order: nil)).to_not be_valid
  end
end
