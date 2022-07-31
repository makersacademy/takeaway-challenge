require 'takeaway'
require 'menu'

describe Takeaway do 
  
  subject(:takeaway) { described_class.new }

  context 'Takeaway has a menu' do 

    it 'prints out menu' do
      expect(takeaway.print_menu).to eq({"Prawn chow mein" => 4.50, "Egg fried rice" => 2.50, "Vegetable fried rice" => 2.75})
    end 
  end

  context 'Placing an order' do 

    it 'allows user to select a number of dishes to order' do
      expect(takeaway.place_order(["Prawn chow mein", "Egg fried rice"])).to eq(["Prawn chow mein", "Egg fried rice"])
    end
  end

  context 'Order total' do 
    it 'allows user to check total of order' do
      order_total = takeaway.place_order(["Prawn chow mein", "Egg fried rice"])
      expect(takeaway.order_total).to eq (7.0)
    end 
   end 

end 