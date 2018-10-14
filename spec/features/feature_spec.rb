require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { TakeAway.new(messenger: messenger) }
  let(:messenger) { double :Messenger }

  # Unit Test 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  describe 'User Story 1' do
    it 'Allows customer to see a list of dishes with prices' do
      expect(takeaway.show_menu).to eq({ 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 })
    end
  end

  # Unit Test 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  describe 'User Story 2' do
    context 'When item is on the menu' do
      it 'Allows customer to add an item to their order' do
        takeaway.add_to_order('pizza')
        expect(takeaway.order_summary).to eq('pizza x1 = £6.99')
      end

      it 'Allows a customer to add a quantitity of an item to their order' do
        takeaway.add_to_order('pizza', 2)
        expect(takeaway.order_summary).to eq('pizza x2 = £13.98')
      end

      it 'Allows a customer to add multiple items in multiple quantities to their order' do
        takeaway.add_to_order('pizza', 2)
        takeaway.add_to_order('burger', 1)
        expect(takeaway.order_summary).to eq('pizza x2 = £13.98, burger x1 = £3')
      end

      it 'Allows customer to add the same items multiple times' do
        takeaway.add_to_order('pizza', 1)
        takeaway.add_to_order('burger', 1)
        takeaway.add_to_order('pizza', 1)
        expect(takeaway.order_summary).to eq('pizza x2 = £13.98, burger x1 = £3')
      end
    end

    context 'When the item is not on the menu' do
      it 'Raises an error' do
        expect { takeaway.add_to_order('curry') }.to raise_error('Invalid dish. Only items on the menu can be added to your order.')
      end
    end

  end

  # Unit Test 3
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe 'User Story 3' do
    context 'When checkout amount does NOT match order total' do
      it 'Raises Error' do
        takeaway.add_to_order('pizza', 2)
        expect(takeaway.total).to eq '£13.98'
        expect { takeaway.checkout(13.99) }.to raise_error('Incorrect amount. You need to enter the correct order total to checkout.')
      end
    end

    context 'When checkout ammount DOES match order total' do
      it 'Does not raise error' do
        takeaway.add_to_order('pizza', 2)
        expect(takeaway.total).to eq '£13.98'
        allow(messenger).to receive(:send_text)
        expect { takeaway.checkout(13.98) }.not_to raise_error
      end
    end

  end

  # Unit Test 4
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'User Story 4' do
    it 'Makes a send_text call to Messenger class' do
      takeaway.add_to_order('pizza', 2)
      allow(messenger).to receive(:send_text)
      expect(messenger).to receive(:send_text)
      takeaway.checkout(13.98)
    end
  end

end
