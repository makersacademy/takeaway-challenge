require 'takeaway'
require 'order'

describe 'Feature-tests' do
  dishes = [{ pizza: '£9' }, { pasta: '£7' }]
  describe "I would like to see a list of dishes with prices" do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'shows a menu with all the dishes and prices' do 
      dishes = [{ pizza: '£9' }, { pasta: '£7' }]
      takeaway = Takeaway.new(dishes)
      expect(takeaway.menu).to eq dishes
    end
  end

  describe "I would like to be able to select some number of several available dishes" do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    # let(:order) { Order.new(dishes) }
    it 'allows multiple dishes to be added to an order' do
      dishes = [{ pizza: '£9' }, { pasta: '£7' }]
      takeaway = Takeaway.new(dishes)
      order = takeaway.new_order
      order.add_to_order("pasta")
      order.add_to_order("pizza")
      expect(order.list).to include pasta: "£7"
      expect(order.list).to include pizza: "£9"
    end
  end

  describe "I would like to check that the total I have been given matches the sum of the various dishes in my order" do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'correctly calculates the total sum of the dishes in an order' do
      dishes = [{ pizza: '£9' }, { pasta: '£7' }]
      takeaway = Takeaway.new(dishes)
      order = takeaway.new_order
      order.add_to_order("pasta")
      order.add_to_order("pizza")
      expect(order.total).to eq "Total for order is: £16."
    end
  end

  describe "I would like to receive a confirming my order and approx. delivery time after I have ordered" do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    it 'sends a confirmation text message, with estimated delivery time, after ordering' do
      dishes = [{ pizza: '£9' }, { pasta: '£7' }]
      takeaway = Takeaway.new(dishes)
      order = takeaway.new_order
      order.add_to_order("pasta")
    end
  end
end
