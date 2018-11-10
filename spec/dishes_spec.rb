require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new }

  it "views a list of dishes with prices to allow an order to be made" do
    expect(dishes).to respond_to(:list).with(1).argument
  end

  it "initializes the list of dishes to an empty array" do
    expect(dishes.list_of_dishes).to eq_to nil
  end
end
