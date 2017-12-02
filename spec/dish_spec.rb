require 'dish'

describe Dish do
  subject(:dish) { described_class.new('name', 'description', 10) }

  context 'can be initialised with accessible values' do

    it '#name' do
      expect(dish.name).to eq 'name'
    end

    it '#description' do
      expect(dish.description).to eq 'description'
    end

    it '#price' do
      expect(dish.price).to eq 10
    end
  end
end
