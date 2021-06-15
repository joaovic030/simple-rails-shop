require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  it { expect(category).to be_valid }
  context 'when name blank' do
    it { expect(build(:category, name: nil)).to_not be_valid }
  end
end
