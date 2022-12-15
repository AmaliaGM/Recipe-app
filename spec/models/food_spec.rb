require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Testng food model'
  subject { Food.new(name: 'Carrot Cake', measurement_unit: 'kg', price: 100) }
  before { subject.save }

  it 'name should be between 3 - 10 characters' do
    subject.name = 'this should be false because it is more than 10'
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'price should not be nil' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'price should not be less than 0' do
    subject.price = -4
    expect(subject).to_not be_valid
  end

  it 'measurment should be kg' do
    expect(subject.measurement_unit).to eq 'kg'
  end

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
