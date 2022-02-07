require_relative '../lib/dishes'

describe Dish do
    
    let(:name) { "Fish"}
    let (:price) { 6.00 }

    subject(:dish) { described_class.new(name, price) }

    describe "#name" do
        it "should return the name of the dish" do
            expect(dish.name).to eq name
        end
    end

    describe "#price" do
        it "should return the price of the dish" do
            expect(dish.price).to eq price
        end
    end
end