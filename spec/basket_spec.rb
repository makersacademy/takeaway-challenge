require 'rspec'
require './src/basket'

describe Basket do
    subject {Basket.new}

    it "should init with an empty basket" do
        expect(subject.basket).to eq(Array.new)
    end
end 