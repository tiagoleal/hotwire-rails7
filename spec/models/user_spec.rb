require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name ' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:name)}
  end
end