require 'food'

describe Food do
  let(:sample_food) { Food.new("Ice Cream", 5, :dessert) }
  let(:less_than_pound) { Food.new("Ketchup", 0.555555, :side) }
  it "creates with a unique ID" do
    expect(Food.new('', 0, :starter).id).to eq(1)
    expect(Food.new('', 0, :main).id).to eq(2)
    expect(Food.new('', 0, :side).id).to eq(3)
  end

  it "initializes with the correct name, price, and course" do
    expect(sample_food.item_name).to eq("Ice Cream")
    expect(sample_food.item_price).to eq(5)
    expect(sample_food.course).to eq(:dessert)
  end

  describe "#to_s" do
    it "prints itself in a human readable way" do
      expect(sample_food.to_s).to eq("Item ##{sample_food.id}: #{sample_food.item_name} - £#{sample_food.item_price} (#{sample_food.course.to_s.capitalize})")
    end

    it "can handle printing items with weird decimals" do
      expect(less_than_pound.to_s).to eq("Item ##{less_than_pound.id}: #{less_than_pound.item_name} - £#{less_than_pound.item_price.round(2)} (#{less_than_pound.course.to_s.capitalize})")
    end
  end
end

describe Drink do
  let(:sample_drink) { Drink.new("Beer", 6, true) }

  it "initializes with the correct name, price and whether alcoholic" do
    beer = Drink.new("Beer", 4.50, true)
    cola = Drink.new("Cola", 2, false)
    expect(beer.item_name).to eq("Beer")
    expect(beer.item_price).to eq(4.50)
    expect(beer.alcoholic).to eq(true)
    expect(cola.alcoholic).to eq(false)
  end

  describe "#to_s" do
    it "identifies itself as a drink while printing" do
      expect(sample_drink.to_s).to eq("Item ##{sample_drink.id}: #{sample_drink.item_name} - £#{sample_drink.item_price.round(2)} (Drink)")
    end
  end
end
