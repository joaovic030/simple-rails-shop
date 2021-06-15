require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:coupon) { create(:coupon) }
  it { expect(coupon).to be_valid }
  it { expect(coupon.token.length).to be > 10 }

  # apenas fazer o before create / ja construido na model
  # context 'when token blank' do
  #   it { expect(build(:coupon, token: nil)).to_not be_valid }
  # end

  context 'when expired_date blank' do
    it { expect(build(:coupon, expired_date: nil)).to_not be_valid }
  end

  context 'when percentage blank' do
    it { expect(build(:coupon, percentage: nil)).to_not be_valid }
  end
end
