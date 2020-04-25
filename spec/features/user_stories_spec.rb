require 'takeaway'
require 'menu'

describe 'User Stories' do
  let(:takeaway) { takeaway = TakeAway.new }
  let(:order) { double() }

    context 'Menu class' do
      # As a customer
      # So that I can check if I want to order something
      # I would like to see a list of dishes with prices
      it 'receive menu' do
        expect(takeaway.menu).not_to be nil
      end

      it 'should print list of dishes' do
        expect{ takeaway.menu_list }.to output.to_stdout
      end
    end

    context 'TakeAway class' do
      # As a customer
      # So that I can order the meal I want
      # I would like to be able to select some number of several available dishes
      it 'otder total to be empty at start' do
        expect(takeaway.order_total.empty?).to be true
      end

      it 'able to place order' do
        takeaway.order "Tomato Salad"
        expect(takeaway.order_total.empty?).to be false
      end

      it 'should be able to order several items' do
        order_total = ["Grilled octopus", "Calamari"]
        takeaway.order "Grilled octopus"
        takeaway.order "Calamari"
        expect(takeaway.order_total).to eq order_total
      end

      # As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of the various dishes in my order
      it 'should respond to checkout' do 
        expect(takeaway).to respond_to(:checkout)
      end

      it 'should give order total upon #checkout' do
        # order_total = "Item: #{order}, cost #{order}£. Total: 38.00"
        # expect(takeaway.checkout).to be order_total
      end

    end

    context 'other' do
      
    end

end