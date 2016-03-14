require 'dishes'

describe Dishes do
  subject(:dish) { described_class.new "chicken", 10 }
  it {is_expected.to respond_to(:name)}

  describe "#initialize" do
    it "should save the name of the dish" do
      expect(dish.name).to eq "chicken"
    end

    it "should save the price of the dish" do
      expect(dish.price).to eq 10
    end

  end


end
