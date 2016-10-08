require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double("dish", :name => "Chicken Teriyaki", :price => 5)}
  let(:dish2) {double("dish2", :name => "Ramen", :price => 7)}
  let(:dish3) {double("dish3", :name => "Pad Thai", :price => 5)}

  it "initialises with a total price sum of 0" do
    expect(order.total_price).to eq 0
  end

  it "initialises with an empty list of order items" do
    expect(order.items).to eq []
  end

  it "stores dishes the customer wants" do
    order.add(dish)
    order.add(dish2)
    expect(order.items).to eq [dish, dish2]
  end

  it "can have multiples of a certain dish added to it" do
    order.add(dish, 2)
    expect(order.items).to eq [dish, dish]
  end

  it "can have dishes removed from its list" do
    order.add(dish)
    order.add(dish2)
    order.remove(dish)
    expect(order.items).to eq [dish2]
  end

  it "can have multiples of a dish removed from its list" do
    order.add(dish, 3)
    order.add(dish2, 2)
    order.remove(dish, 2)
    expect(order.items).to eq [dish, dish2, dish2]
  end

  it "calculates a total price" do
    order.add(dish, 2)
    expect(order.total_price).to eq 10
  end

  it "shows a receipt with the ordered dishes (name + price) and the total price" do
    order.add(dish, 2)
    order.add(dish3)
    order.add(dish2)
    expect(order.receipt).to eq "You ordered:\n2 x Chicken Teriyaki £10\n1 x Pad Thai £5\n1 x Ramen £7\nfor a total of £22"
  end

  it "can be placed by passing in an amount of money" do
    expect(order).to respond_to(:place).with(1).argument
  end

  it "is only confirmed if the correct amount of money was given when placing the order" do
    order.add(dish,2)
    expect(order.place(6)).to eq "That's not enough money, please try again"
  end

  it "accepts even the most ridiculous tips" do
    order.add(dish,2)
    expect(order.place(15)).to eq "Thank you for the tip!"
  end

  it "sends a text upon confirmation" do
    order.add(dish,2)
    expect(order).to receive(:text)
    order.place(10)
  end

  it "doesn't send a text if payment was not right" do
    order.add(dish,2)
    expect(order).not_to receive(:text)
    order.place(7)
  end
end
