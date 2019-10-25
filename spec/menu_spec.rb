require 'rspec'
require './src/menu'
require './src/item'

describe Menu do

    subject {Menu.new}

    it "should init with an empty basket" do
        expect(subject.basket).to eq(Array.new)
    end

    it "should display a list of items in the menu" do
        expect(subject.menu).to include(a_kind_of(Item))
    end

    it "should allow the user to add various items to the basket" do
        subject.AddToBasket("Pizza", 1)
        expect(subject.basket[0].name).to eq("Pizza")
    end
    it "should allow the user to add numerous amounts of the same item to the basket" do
        subject.AddToBasket("Pizza", 2)
        expect(subject.basket[1].name).to eq("Pizza")
    end
end 