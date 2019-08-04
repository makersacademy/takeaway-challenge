require './lib/menu.rb'
require './lib/order.rb'
require './lib/confirmation_text.rb'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:pizza1) { 'pepperoni' }
  let(:pizza2) { 'hawaiian' }
  let(:amount) { 2 }

  context 'User story 1' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'Should have a list of dishes and prices' do
      expect(takeaway.view_menu).to eq ({ 'pepperoni' => 10,
                                          'hawaiian' => 12,
                                          'meat_feast' => 15,
                                          'vegetarian' => 9,
                                          'spicy_sauasage' => 11,
                                          'awesome_sauce' => 0.59})
    end
  end
  context 'User Story 2' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'Should have a default order amount of 1 if no argument given' do
      takeaway.menu_select(pizza2)
      expect(takeaway.view_basket).to eq [{ 'hawaiian' => 12 }]
    end

    it 'Should allow order amount selection' do
      takeaway.menu_select(pizza2, 2)
      expect(takeaway.view_basket).to eq [{ 'hawaiian' => 12 }, { 'hawaiian' => 12 }]
    end

  end
  context 'User Story 3' do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order

    it 'Should allow menu selection to be stored in the order array' do
      takeaway.menu_select(pizza1)
      expect(takeaway.view_basket).to eq ['pepperoni' => 10]
    end

    it 'Should allow user to view their order' do
      expect(takeaway).to respond_to(:view_basket)
    end

    it 'Should give an order total' do
      takeaway.menu_select(pizza1, amount)
      takeaway.menu_select(pizza2, amount)
      takeaway.order.calculate_price
      expect(takeaway.view_total_price).to eq 44
    end
  end
  context 'User story 4' do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  end

end
