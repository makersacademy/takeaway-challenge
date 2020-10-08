require 'Basket'

describe Basket do
  let(:basket) {Basket.new}
  let(:curry) {double(:dish, :name => "curry", :price => 8)}
  let(:rice) {double(:dish, :name => "rice", :price => 3)}
  it "starts off with no dishes" do
    expect(basket.dishes.length).to eq 0
  end

  it "can add a dish" do
    basket.add(curry)
    expect(basket.dishes).to include curry
  end

  it "can calculate a total price" do
    basket.add(curry)
    basket.add(rice)
    expect(basket.total_price).to eq 11
  end
end