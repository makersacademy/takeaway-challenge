require 'order'
require 'pry'

describe Order do
  let(:burger) { double(:Item, name: "Burger", price: 6) }
  let(:coke) { double(:Item, name: "Coke", price: 2) }
  before "add food to order" do
    subject.add(burger, coke)
  end
  it "can view the menu" do
    expect(subject.view).to include burger, coke
  end
end
