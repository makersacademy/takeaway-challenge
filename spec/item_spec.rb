require 'rspec'
require './src/item'

describe Item do

    subject {Item.new}

    it "should create an empty Item object with name = nil" do
        expect(subject.name).to eq(nil)
    end
    it "should create an empty Item object with price = nil" do
        expect(subject.name).to eq(nil)
    end

    context "Item with arguments" do
        subject {Item.new("Burger", 2.99)}

        it "should create an create a new Item with a name set" do
            expect(subject.name).to eq("Burger")
        end
        it "should create a new Item with a price set" do
            expect(subject.price).to eq(2.99)
        end
    end
end
