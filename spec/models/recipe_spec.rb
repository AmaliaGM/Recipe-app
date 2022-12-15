require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Tests cases for Recipe model  ' do
    @user = User.new(name: 'Amalia', email: 'amalia@gmail.com', password: 'amaliatest')
    subject do
      Recipe.new(user: @user, name: 'meat', description: 'first recipe added to food',
                 preparation_time: '20min', cooking_time: '30min', public: true)
    end
    before { subject.save }

    it 'the name is valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'the name field s not blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'name should be more than 250 characters' do
      subject.name = 'this should not be valid because its less than 250'
      expect(subject).to_not be_valid
    end

    it 'preparation time should not be blank' do
      subject.preparation_time = ''
      expect(subject).to_not be_valid
    end

    it 'cooking time should not be blank' do
      subject.cooking_time = ''
      expect(subject).to_not be_valid
    end
  end
end
