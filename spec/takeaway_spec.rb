require 'takeaway'

describe Takeaway do 
  let(:takeaway) { described_class.new }
  let(:menu) { Menu.new }


  describe '#display_menu' do 
   it "Shows menu hash with list of foods/prices" do 
      expect(takeaway.display_menu).to eq(menu.list)
    end 
  end 

  describe '#new_order' do 
    it "Allows customer to create a new order instance from takeaway" do 
      expect(takeaway.new_order.basket).to eq(Hash.new)
    end 
  end 
   
end 


describe Order do 
  let(:order) { described_class.new }

  describe '#add_to_basket' do 
    it "Adds multiple items to basket" do 
      order.add_to_basket("pizza", "8.99")
      order.add_to_basket("chips", "3.99")
      expect(order.basket).to eq({ :pizza => "8.99", :chips => "3.99" })
    end
  end 
end
