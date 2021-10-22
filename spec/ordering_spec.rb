require 'ordering'

describe Ordering do 
  let(:my_order) {Ordering.new}

  
  context '#order' do 
    it 'allows a customer to see a list of dishes' do  
      expect(my_order.see_menu). to eq my_order.menu
    end 
  
    it 'allows a customer to order one dish' do 
      my_order.order("Big mac")
      expect(my_order.customers_order). to eq ["Big mac"]
    end
  
    it 'doesnt allow a customer to order something that isnt on the menu' do
      expect{my_order.order("Whopper Burger")}. to raise_error "ERROR: The dish Whopper Burger is not available on the menu"
    end 
  
    it 'allows a customer to order multiple dishes' do 
      my_order.order("Big mac")
      expect(my_order.order("Chicken Nuggets")) . to eq ["Big mac", "Chicken Nuggets"]
    end 
  end 

  context '#checkout'
    it 'checks the total price of one dish at checkout' do
      my_order.order("Big mac")
      expect(my_order.checkout). to eq 3.00
    end 

    it 'checks the total price of multiple items at checkout' do
      my_order.order("Big mac")
      my_order.order("Chicken Nuggets")
      expect(my_order.checkout). to eq 5.50
    end 


puts "DONT FORGET TO GIT ADD AND COMMIT "
end 
