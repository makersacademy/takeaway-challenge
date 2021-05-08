require 'restaurant.rb'

describe Restaurant do
  describe '#show_menu' do
    it 'outputs a hash of dishes and prices' do
      expect(subject.show_menu).to eq ({ "chips" => 1.50, "chicken" => 2.00 })
    end
  end
  describe '#order' do
    it 'stores a customer order in a basket' do
      subject.order("chips", 3)
      expect(subject.basket).to include "chips" => 3
    end

    it 'increases the portions in basket when a dish is ordered again' do
        subject.order("chips")
        subject.order("chips")
        expect(subject.basket).to include "chips" => 2
    end
  end
end
