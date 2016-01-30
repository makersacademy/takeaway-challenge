require 'takeaway'

describe TakeAway do
  subject(:take_away) {described_class.new}
  
  describe "default" do
    it "starts with an empty basket" do
      expect(take_away.basket).to be_empty
    end
  end
  
  describe "#menu" do
    it "can read menu" do
      expect(take_away.read_menu).to include "Egg Fried Rice"
    end
  end
  
  describe "#order" do
    it 'allows you too select items from the menu' do
      take_away.order "Egg Fried Rice"
      expect(take_away.basket_summary).to eq "Egg Fried Rice x1: £1.90"
    end
    
    it 'only lets you order items on the menu' do
      dish = "Tikka Masala"
      expect { take_away.order(dish) }.to raise_error "#{dish} is not on the menu"
    end
  end
end