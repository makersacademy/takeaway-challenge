require_relative '../lib/dish'

describe Dish do
    let (:dish) { Dish.new(:name, :price) }
  
    it 'has a name' do
      expect(dish.name).to eq :name
    end
  
    it 'has a price' do
      expect(dish.price).to eq :price
    end

      it 'initialising a new dish requires arguments' do
    expect { Dish.new }.to raise_error(ArgumentError)
  end
  
  it 'initialising a new dish requires two arguments' do
    expect { Dish.new('fries', 2) }.to_not raise_error
  end
  end