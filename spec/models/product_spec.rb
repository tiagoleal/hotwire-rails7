require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description,price ' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:description)}
    it { is_expected.to validate_presence_of(:price)}
  end
end