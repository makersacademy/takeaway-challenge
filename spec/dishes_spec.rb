require 'dishes'

describe Dishes do

let(:dishes) {Dishes.new}
let(:food1) {double (:food1)}
let(:food2) {double (:food2)}
let(:price1) {double (:price1)}
let(:price2) {double (:price2)}

    context "when all_dishes is called" do


    end

    context "when add a dish is called" do
      it " the dish should be added" do
        expect(dishes.add_dish(food1, price1, true)).to eq [{:name => food1, :price => price1, :availability => true}]
      end
    end

    context "when all_dishes is called" do
      it "all of the dishes should be shown" do
        dishes.add_dish(food1, price1, true)
        dishes.add_dish(food2, price2, false)
        expect(dishes.all_dishes).to eq [{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}]
      end
    end


end
