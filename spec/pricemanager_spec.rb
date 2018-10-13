require "./lib/pricemanager.rb"

describe PriceManager do

  let(:pricemanager) { described_class.new() }
  let(:dish) { double :dish, :category => "drink" }

  it "checks and allocates price to dishes depending on category" do
    expect(pricemanager.get_dish_price(dish.category)).to eq 5
  end

  it "checks and returns default price if dish not in defined categories" do
    expect(pricemanager.get_dish_price("rubbish")).to eq 50
  end

  it "proves price total for an order" do
    orderlist = { dish => 3 }
    expect(pricemanager.calculate_order_value(orderlist)).to eq 15
  end
end
