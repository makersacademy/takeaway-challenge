require 'dish'

describe 'Dish' do 

  dish = Dish.new

  it 'should have name and price as instance variables' do
    expect(dish).to respond_to(:price, :name)
  end  
  
  it 'The default dish of curry should have a price of 10' do
    expect(Dish.curry.name).to eq(:curry)
    expect(Dish.curry.price).to eq(10)
  end

  it 'The default dish of pasta should have a price of 20' do
    expect(Dish.pasta.name).to eq(:pasta)
    expect(Dish.pasta.price).to eq(20)
  end

  it 'The default dish of pizza should have a price of 20' do
    expect(Dish.pizza.name).to eq(:pizza)
    expect(Dish.pizza.price).to eq(30)
  end

  it 'The default dish of burger should have a price of 20' do
    expect(Dish.burger.name).to eq(:burger)
    expect(Dish.burger.price).to eq(40)
  end

end  