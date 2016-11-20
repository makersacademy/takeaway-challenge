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
        expect(dishes.add_dish(food1, price1)).to eq [{"Pizza" => 5},{"Pasta" => 3},{"Macaroni and Cheese" => 2},{food1 => price1}]
      end
    end

    context "when all_dishes is called" do
      it "all of the dishes should be shown" do
        dishes.add_dish(food1, price1)
        dishes.add_dish(food2, price2)
        expect(dishes.all_dishes).to eq [{"Pizza" => 5}, {"Pasta" => 3}, {"Macaroni and Cheese" => 2},{food1 => price1},{food2 => price2}]
      end
    end


end
