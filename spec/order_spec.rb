require 'order'
require 'menu'

describe Order do 
    subject(:order1) { described_class.new }
    it 'customer can add a dish to basket' do
        order1.selection('Mystery meat sushi')   
        expect(order1.basket).to include 'Mystery meat sushi'
    end
    it "ensures the customer doesn't order from outside the menu" do
        expect { order1.selection('Cola') }.to raise_error 'Please select from one of the tasty dishes available!'
    end    
end
