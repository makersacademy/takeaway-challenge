require 'takeaway'
require 'menu'

describe Takeaway do

  let(:takeaway) { described_class.new(menu_double) }
  
  let(:menu_double) { double(:Menu, dish: { "Steak" => 18, "Burger" => 13, "Chicken" => 9, "Fries" => 3, "Cola" => 2 }) }

  describe '#show_menu' do
    it 'displays a list of dishes and prices' do
      expect(takeaway.show_menu).to eq menu_double
    end
  end 

  describe '#add_item' do
    it 'allows you to add a dish with a quantity' do
      takeaway.add_item("Steak", 2)
      expect(takeaway.basket).to eq({ "Steak" => 2 })
    end
  end 
end 
