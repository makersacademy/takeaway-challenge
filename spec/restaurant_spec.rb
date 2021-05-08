require 'restaurant.rb'

describe Restaurant do
  describe '#show_menu' do
    it 'outputs a hash of dishes and prices' do
      expect(subject.show_menu).to eq ({ "chips" => 1.50, "chicken" => 2.00 })
    end
  end
end
