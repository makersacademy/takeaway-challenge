require 'menu'
require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(Menu)}


  describe 'User Story 1' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    context 'when a customer reads the menu' do
      it 'should display the dishes and prices' do
        expect(takeaway.check_menu).to eq "Bombay Aloo : £5\nLamb Passanda : £9\nChicken Tikka Masala : £8"
      end
    end
  end

  describe 'User Story 2' do
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    context 'when a customer wants a dish' do
      it 'should let them place an order' do
        takeaway.place_order('Bombay Aloo', 1)
        takeaway.place_order('Lamb Passanda', 3)
        expect(takeaway.order).to include(['Bombay Aloo', 1], ['Lamb Passanda', 3])
      end
    end
  end

  describe 'User Story 3' do
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
    context 'when a customer places an order' do
      xit 'should return the final bill' do
        takeaway.place_order('Bombay Aloo', 3)
        takeaway.place_order('Lamb Passanda', 1)
        expect(takeaway.verify_order).to eq 24
      end
    end
  end

end
