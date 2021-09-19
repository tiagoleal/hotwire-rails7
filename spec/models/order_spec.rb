require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid' do
    order = create(:order)
    expect(order).to be_valid
  end

  context 'Association' do
    it { is_expected.to belong_to(:user)}
  end
end