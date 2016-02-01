require 'order'
require 'menu'
require 'calculate_bill'
require 'message'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Order do
  subject(:order){described_class.new}
  
  it 'starts a new order' do
   order
  end

  describe '#show_menu' do
    it 'shows the list of available dishes' do
    order.show_menu
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of 
# several available dishes
  
  describe '#choose' do
   it 'records the quantity as well' do
    order.choose("Margherita", 2)
   end
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given 
# matches the sum of the various dishes in my order

  describe '#total cost' do
   it 'returns the total cost of the order' do
    order.total_cost
   end
  end

  describe '#check_total' do
   it 'returns itemised total' do
    order.check_total
   end
  end

  describe '#send_message' do
    xit 'sends confirmation message' do
      order.send_message
    end
  end
end

describe CalculateBill do
  subject(:calc){described_class.new}
  
  it 'returns final total' do
    calc.final_total([{"Margherita" => 2}])
  end

  it 'returns itemised bill' do
    calc.itemised_bill([{"Margherita" => 2}])
  end
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order 
# was placed and will be delivered before 18:52" after I have ordered

describe Message do
  subject(:new_message){described_class.new}
  #let(:message){double (:new_message)}

  xit 'sends a confirmation message' do
    new_message.send([{"Margherita" => 2}])
  end
end



















