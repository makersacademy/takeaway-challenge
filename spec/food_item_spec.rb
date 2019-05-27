require 'food_item'

describe FoodItem do
  let(:food_item) { FoodItem.new("Pizza", 1500) }

  it 'should respond to Food_item class' do
    expect(food_item).to be_a_kind_of(FoodItem)
  end

  it 'should respond to name' do
    expect(food_item).to respond_to(:name)
  end

  it 'should respond to price' do
    expect(food_item).to respond_to(:price)
  end
end
