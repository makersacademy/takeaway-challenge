require 'dish'

describe Dish do
  it 'returns the correct price for an item' do
    expect(Dish.new('meatballs', 8.95).price).to eq 8.95
  end

  it 'has an id that is id of previous dish + 1' do
    dish_1 = Dish.new('rye bread', 5.89)
    expect(Dish.new('caraway cheese', 5.95).id).to eq dish_1.id + 1
  end
end
