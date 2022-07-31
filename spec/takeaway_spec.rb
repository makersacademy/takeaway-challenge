require 'takeaway'
require 'menu'

describe Takeaway do

  let(:takeaway) { described_class.new(menu_double) }
  
  let(:menu_double) { double(:Menu, dish: { "Steak" => 18, "Burger" => 13, "Chicken" => 9, "Fries" => 3, "Cola" => 2 }) }

  describe '#show_menu' do
    it 'displays a list of dishes and prices' do
      expect(takeaway.show_menu).to eq menu_double.dish
    end
  end 

  describe '#add_item' do
    it 'allows you to add a dish with a quantity' do
      takeaway.add_item("Steak", 2)
      expect(takeaway.basket).to eq({ "Steak" => 2 })
    end

    context 'when item not on menu added' do
      it 'raises an error' do
        expect { takeaway.add_item("Noodles", 1) }.to raise_error('Item not on menu. Please pick something else')
      end 
    end 
  end

  describe '#total_bill' do
    it 'shows the total of items in basket' do
      takeaway.add_item("Steak", 2)
      takeaway.add_item("Fries", 3)
      expect(takeaway.total_bill).to eq 45
    end 
  end 
end 
