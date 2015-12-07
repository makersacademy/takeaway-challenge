require 'order'
require 'menu'
require 'takeaway'

describe 'User Stories' do

  describe 'Menu' do

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it 'should display a list of dishes with prices' do
      menu = Menu.new
      expect(menu.contents).not_to be_empty
    end
  end

  describe 'Order' do

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    it 'allows user to select some number of several dishes' do
      order = Order.new(Menu.new.contents)
      order.choose("Dish 1", 2)
      expect(order.dishes).not_to be_empty
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given
    # matches the sum of the various dishes in my order

    it "should check if the customer's total matches the sum of the order" do
      takeaway = Takeaway.new(Order)
      takeaway.new_order(Menu.new.contents)
      takeaway.order.choose("Dish 1", 3)
      takeaway.order.calculate_quantities(takeaway.order.dishes)
      takeaway.order.calculate_cost(takeaway.order.dishes)
      expect{
        takeaway.place_order(takeaway.order,takeaway.order
        .quantity,takeaway.order.total, ENV['PHONE_NUM'])
      }.not_to raise_error
    end
  end

  describe 'Takeaway' do

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was
    # placed and will be delivered before 18:52" after I have ordered

    it "should send a text to confirm the order was placed" do
      takeaway = Takeaway.new(Order)
      takeaway.new_order(Menu.new.contents)
      takeaway.order.choose("Dish 1", 3)
      takeaway.order.calculate_quantities(takeaway.order.dishes)
      takeaway.order.calculate_cost(takeaway.order.dishes)
      takeaway.place_order(takeaway.order,takeaway.order.quantity,takeaway.order
      .total, ENV['PHONE_NUM'])
    end
  end
end
