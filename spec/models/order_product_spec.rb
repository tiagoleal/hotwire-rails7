require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it 'is valid with quantity' do
    order_product = create(:order_product)
    expect(order_product).to be_valid
  end

  context 'Association' do
    it { is_expected.to belong_to(:product)}
    it { is_expected.to belong_to(:order)}
  end
end