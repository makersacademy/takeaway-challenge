require 'takeaway'
require 'menu'

describe 'User Stories' do
  let(:takeaway) { takeaway = TakeAway.new }
  let(:order) { double() }
  context 'TakeAway menu' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'receive menu' do
      expect(takeaway.menu).not_to be nil
    end

    it 'should print list of dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end

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
      test_order = ["Grilled octopus", "Calamari"]
      takeaway.order "Grilled octopus"
      takeaway.order "Calamari"
      expect(takeaway.order_total).to eq test_order
    end


  end


  context 'Menu class' do
    it 'should respond to #menu' do
      menu = Menu.new
      expect { menu.print }.to output.to_stdout
    end

  end

end