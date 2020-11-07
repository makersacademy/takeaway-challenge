require 'food'

describe Food do
  it "creates with a unique ID" do
    expect(Food.new('', 0, :starter).id).to eq(1)
    expect(Food.new('', 0, :main).id).to eq(2)
    expect(Food.new('', 0, :side).id).to eq(3)
  end

  it "initializes with the correct name, price, and course" do
    sample_food = Food.new("Ice Cream", 5, :dessert)
    expect(sample_food.item_name).to eq("Ice Cream")
    expect(sample_food.item_price).to eq(5)
    expect(sample_food.course).to eq(:dessert)
  end
end

describe Drink do
  it "initializes with the correct name, price and whether alcoholic" do
    beer = Drink.new("Beer", 4.50, true)
    cola = Drink.new("Cola", 2, false)
    expect(beer.item_name).to eq("Beer")
    expect(beer.item_price).to eq(4.50)
    expect(beer.alcoholic).to eq(true)
    expect(cola.alcoholic).to eq(false)
  end
end