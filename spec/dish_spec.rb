require_relative '../lib/dish'

describe Dish do

  let(:dish) { Dish.new(:name, :price) }

  describe '#initiatize' do

    it 'creates new dish with readable @name' do
      expect(dish.name).to eq :name
    end

    it 'creates new dish with readable @price' do
      expect(dish.price).to eq :price
    end

  end
end