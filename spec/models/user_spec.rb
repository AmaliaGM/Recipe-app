require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'testing associations' do
    it 'has many Recipes' do
      assc = described_class.reflect_on_association(:recipes)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Foods' do
      assc = described_class.reflect_on_association(:foods)
      expect(assc.macro).to eq :has_many
    end
  end
end
