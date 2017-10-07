require './lib/dish.rb'

describe Dish do

  subject(:dish) { described_class.new(name: 'Test Dish 1', description: 'Test description.', price: 10.95) }

  context '#initialization' do
    it 'creates a Dish with a name, description, and price' do
      expect(dish).to be_an_instance_of Dish
    end

    it { is_expected.to respond_to(:name) }

    it { is_expected.to respond_to(:description) }

    it { is_expected.to respond_to(:price) }

  end

end
