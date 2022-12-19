RSpec.describe RecipeFood, type: :model do
  describe 'Test for RecipeFood model' do
    @user = User.new(name: 'Amalia', email: 'amalia@gmail.com', password: 'amaliatest')
    @food = Food.new(name: 'cake', price: 10, measurement_unit: 'kilogram')
    @recipe = Recipe.new(user: @user, name: 'meat', description: 'first recipe added to food',
                         preparation_time: '20min', cooking_time: '30min', public: true)

    subject { RecipeFood.new(recipe: @recipe, food: @food, quantity: 5) }
    before { subject.save }

    it 'the value of quantity less than 0 should be invalid' do
      subject.quantity = -5
      expect(subject).to_not be_valid
    end

    it 'the exact quantity should be 4' do
      subject.quantity = 4
      expect(subject.quantity).to eq '4'
    end

    it 'quantity should be valid' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
  end
end
