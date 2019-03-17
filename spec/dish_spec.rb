require 'dish' 

describe Dish do

  subject(:dish) { described_class.new('Onion, Rosemary & Cheddar',11,true)}
  it 'creates a dish' do
    expect(dish).to be_kind_of Dish
  end

  it 'shows its contents' do
    dish = Dish.new('Onion, Rosemary & Cheddar',11,true)
    expect(dish.details).to eq("Onion, Rosemary & Cheddar - 11")
  end

end