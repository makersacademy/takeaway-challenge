require 'takeaway'
require 'menu'
require 'kitchen'

describe 'User Stories' do
  let(:takeaway) { takeaway = TakeAway.new }
  let(:kitchen) { kitchen = Kitchen.new }
  let(:order) { double() }

  context 'Menu class' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'receive menu' do
      expect(takeaway.menu_list).not_to be nil
    end

    it 'should print list of dishes' do
      expect { takeaway.menu_list }.to output.to_stdout
    end
  end

  context 'Kitchen class' do
    it 'should save order' do
      kitchen.order "Tomato Salad"
      expect(kitchen.order_cart).to eq kitchen.order_cart
    end

    it 'should save multiple orders' do
      kitchen.order "Calamari"
      kitchen.order "Tomato Salad"
      expect(kitchen.order_cart).to eq kitchen.order_cart
    end

    it 'should print out order and total' do
      kitchen.order "Calamari"
      kitchen.order "Tomato Salad"
      expect { kitchen.order_total }.to output.to_stdout
    end

  end

  context 'TakeAway class' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'order total to be empty at start' do
      expect(kitchen.order_cart.empty?).to be true
    end

    it 'able to place order' do
      expect(takeaway.order("Tomato Salad").empty?).to be false
    end

    it 'should be able to order several items' do
      takeaway.order "Grilled octopus"
      takeaway.order "Calamari"
      expect(kitchen.order_cart).to eq kitchen.order_cart
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'should respond to checkout' do 
      expect(takeaway).to respond_to(:checkout)
    end

    it 'should give order total upon #checkout' do
      # order_cart = "Item: #{order}, cost #{order}£. Total: 38.00"
      # expect(takeaway.checkout).to be order_cart
    end

  end

end
