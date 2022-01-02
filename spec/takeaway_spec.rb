require 'takeaway'
require 'menu'

describe Takeaway do

  let(:takeaway) { described_class.new(menu_double)}
  
  let(:menu_double) { double(:Menu, dish: [
    { "Steak" => 18 },
    { "Burger" => 13 },
    { "Chicken" => 9 },
    { "Fries" => 3 },
    { "Cola" => 2 }
  ])
    }

  describe '#show_menu' do
    it 'displays a list of dishes and prices' do
      expect(takeaway.show_menu).to eq menu_double
    end

  end 
end