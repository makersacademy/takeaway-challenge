require 'rspec'
require './src/menu'

describe Menu do
    subject {Menu.new}

    it "should init with an empty basket" do
        expect(subject.basket).to eq(Array.new)
    end
end 