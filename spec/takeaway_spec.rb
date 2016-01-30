require 'takeaway'

describe TakeAway do
  subject(:take_away) {described_class.new}
  
  describe "#menu" do
    it "can read menu" do
      expect(take_away.read_menu).to include "Egg Fried Rice"
    end
  end
  
  describe "#basket_summary" do
    before do
      take_away.order "Egg Fried Rice"
    end
    
    it 'allows you too select items from the menu' do
      expect(take_away.basket_summary).to eq "Egg Fried Rice x1: £1.90"
    end
    
    it 'only lets you order items on the menu' do
      dish = "Tikka Masala"
      error = "#{dish} is not on the menu"
      expect { take_away.order(dish) }.to raise_error error
    end
    
    it "adds multiple items to the basket" do
      take_away.order 'Spring Roll'
      expect(take_away.basket_summary).to include 'Spring Roll'
    end
  end
  
  describe "#total" do
    it 'returns the order total' do
      take_away.order "Spring Roll"
      expect(take_away.total).to eq "Total: £1.50"
    end
  end
  
  describe "#complete" do
    it "Completes an order" do
      take_away.order "Spring Roll"
      take_away.total
      expect(take_away.complete_order(1.50)).to eq "Order Complete"
    end
    
    it "Raises an error if sum doesn't match total" do
      expect {take_away.complete_order(5.30)}.to raise_error "Value does not match the total"
    end
  end
end