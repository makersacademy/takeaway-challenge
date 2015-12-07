require 'menu'
require 'takeaway'
require 'text'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(menu, order_klass, text) }
  let(:menu) { Menu.new }
  let(:order_klass) { Order }
  let(:text) { Text.new }

  context  do
    before(:each) do
      takeaway.menu.create(:soup, 4.99)
      takeaway.menu.create(:sandwich, 5.99)
      takeaway.menu.create(:pie, 7.99)
    end

  describe 'User Story 1' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    context 'when a customer reads the menu ' do
      it 'it should display the dishes and prices' do
        expect(takeaway.check_menu).to include(pie: 7.99)
      end
    end
  end

  describe 'User Story 2' do
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    context 'when a customer wants a dish' do
      it 'it should let them place an order' do
        takeaway.place_order(:soup, 1)
        takeaway.place_order(:sandwich, 3)
        expect(takeaway.check_order).to eq "soup x 1: total £4.99\nsandwich x 3: total £17.97\n"
      end
    end
  end


  describe 'User Story 3' do
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
    context 'when a customer places an order' do
      it 'it should return the final bill' do
        takeaway.place_order(:soup, 3)
        takeaway.place_order(:pie, 4)
        expect(takeaway.confirm_order).
        to eq "soup x 3: total £14.97\npie x 4: total £31.96\nFinal bill: £46.93"
      end
    end
  end

  describe 'User Story 4' do
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    context 'when a customer places an order' do
      it 'it should send a confirmation text' do
        expect(takeaway.text).to receive(:send_text).with(Integer)
        takeaway.complete_order
      end
    end
  end
  end
end
