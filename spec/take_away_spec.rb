require 'takeaway'
require 'menu'

describe Takeaway do 
  
  subject(:takeaway) { described_class.new } 

  context 'Takeaway has a menu' do 
    
    it 'prints out menu' do
      menu = Menu.new
      expect(takeaway.print_menu).to eq({"Prawn chow mein" => 4.50, "Egg fried rice" => 2.50})
    end 
  end

  # context 'Placing an order' do 

  #   it 'allows user to select a number of dishes to order' do
  #     # p takeaway 
  #     takeaway.place_order("Prawn chow mein", 2)
  #     expect(takeaway.place_order("Prawn chow mein", 2)).to eq("Dishes selected: Prawn chow mein x 2")
  #   end
  # end

end 