require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:brand) { create(:brand) }

  it { expect(brand).to be_valid }
  context 'when name blank' do
    it { expect(build(:category, name: nil)).to_not be_valid }
  end
end
