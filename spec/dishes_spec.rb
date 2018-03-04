require './lib/dishes.rb'

describe Dish do

  subject(:dish) { described_class.new(:name, :price) }

  context "Provided the initialized dish details (name, price)" do

    describe "#name" do
      it "displays the name of the dish" do
        expect(dish.name).to eq :name
      end
    end

    describe "#price" do
      it "displays the price of the dish" do
        expect(dish.price).to eq :price
      end
    end

  end

end
