require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { TakeAway.new }

  # Unit Test 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  describe 'User Story 1' do
    it 'so that the customer can order something it shows the ist of dishes with prices' do
      expect(takeaway.show_menu).to eq({ 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 })
    end
  end

  # Unit Test 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe 'User Story 2' do
    it 'allows customer to add an item to their order' do
      takeaway.add_to_order('pizza')
      expect(takeaway.order_summary).to eq('pizza x1 = £6.99')
    end

    it 'allows a customer to add a quantitity of an item to their order' do
      takeaway.add_to_order('pizza', 2)
      expect(takeaway.order_summary).to eq('pizza x2 = £13.98')
    end

    it 'allows customer to add multiple items in multiple quantities to their order' do
      takeaway.add_to_order('pizza', 2)
      takeaway.add_to_order('burger', 1)
      expect(takeaway.order_summary).to eq('pizza x2 = £13.98, burger x1 = £3')
    end
  end

  # Unit Test 3
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  # describe 'User Story 3' do
  #   it 'Can return order total' do
  #     takeaway.add_to_order('pizza', 2)
  #     expect(takeaway.total).to eq '£13.98'
  #   end
  # end

  # Unit Test 4
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
