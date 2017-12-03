require 'order'
require 'menu'

describe Order do 
    subject(:order1) { described_class.new }
    let(:selection) { double :selection }
    let(:view_basket) { double :view_basket }
    it 'customer can add a dish to basket' do
        order1.selection('Mystery meat sushi')   
        expect(order1.basket).to include 'Mystery meat sushi'
    end
    it "ensures the customer doesn't order from outside the menu" do
        expect { order1.selection('Cola') }.to raise_error 'Please select from one of the tasty dishes available!'
    end
    it 'customer can check the quantity of dishes currently in their basket' do 
        order1.selection('Sea bass saute', 6)
        expect(order1.view_basket).to eq 'There are currently 6 dishes in your basket.'
    end
    it 'customer can add several quantities of the same dish' do 
        order1.selection('Golden egg galette', 2)
        expect(order1.basket).to include 'Golden egg galette', 'Golden egg galette'
    end
end
