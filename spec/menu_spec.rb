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
end 