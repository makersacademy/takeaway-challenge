require 'restaurant.rb'

describe Restaurant do
  describe '#show_menu' do
    it 'outputs a hash of dishes and prices' do
      expect(subject.show_menu).to eq ({ "chips" => 1.50, "chicken" => 2.00 })
    end
  end
  describe '#order' do
    it 'stores the order in a basket' do
      subject.order("chips", 3)
      expect(subject.basket).to include "chips" => 3
    end

  end
end
