require 'takeaway'
require 'Timecop'

describe Takeaway do
  let(:test_takeaway) { Takeaway.new }
  let(:test_menu) { TEST_MENU_DISPLAY_STRING }
  let(:empty_order) { [] }
  let(:test_order_1) { TEST_ORDER_1_DISPLAY_STRING }
  let(:revised_order_1) { REVISED_ORDER_1_DISPLAY_STRING }
  let(:checkout_message_1) { TEST_CHECKOUT_MESSAGE_1 }
  let(:place_order_message_1) { TEST_PLACE_ORDER_CONFIRMATION }
  let(:dummy_text) { DUMMY_TEXT } # will be upgraded to Twilio API
  let(:dummy_customer) { instance_double('Customer', address: FAKE_ADDRESS, number: FAKE_NUMBER, payment: FAKE_PAYMENT) }

  describe '#display_menu' do
    it "display the menu with each dish number, name and price" do
      expect(test_takeaway.display_menu).to eq test_menu
    end
  end

  describe '#add_to_order' do
    it 'adds an item to the order' do
      expect(test_takeaway.add_to_order(4, 1)).to eq({ 'Space Whale Sashimi' => 1 })
    end
  end

  describe '#remove_from_order' do
    it 'removes an item from the order' do
      test_takeaway.add_to_order(2, 2)
      test_takeaway.add_to_order(4, 2)
      test_takeaway.add_to_order(5, 1)
      expect(test_takeaway.remove_from_order(2, 1)).to eq revised_order_1
    end
  end

  describe '#display_current_order' do
    context 'when no items have been added to order' do
      it "displays an empty list" do
        expect(test_takeaway.display_current_order).to eq "You have not selected any items."
      end
    end

    context 'when several items have been added to order' do
      it "displays your order with the quantities, prices per item, subtotal and the Total" do
        test_takeaway.add_to_order(2, 2)
        test_takeaway.add_to_order(4, 2)
        test_takeaway.add_to_order(5, 1)
        expect(test_takeaway.display_current_order).to eq test_order_1
      end
    end
  end

  describe '#checkout' do
    context 'when no items have been added to the order' do
      it 'tells you to add items before checkingout' do
        expect(test_takeaway.checkout(dummy_customer)).to eq "Please add items before checking out."
      end
    end

    context 'when items have been added to the order' do
      it 'displays your order, your address, number and asks you to place your order' do
        test_takeaway.add_to_order(2, 2)
        test_takeaway.add_to_order(4, 2)
        test_takeaway.add_to_order(5, 1)
        # puts test_takeaway.current_order.cost
        expect(test_takeaway.checkout(dummy_customer)).to eq checkout_message_1
      end
    end
  end

  describe '#place_order' do
    before do
      @test_text = instance_double('SendText')
      @test_takeaway_text = Takeaway.new(Menu.new, Order, @test_text)
      allow(@test_text).to receive(:send_confirmation).with(any_args).and_return("Thank you! Your order was placed and will be delivered by 19:15")
    end

    context 'when no items have been added to order' do
      it 'tells you to add items before placing an order' do
        expect(@test_takeaway_text.place_order(dummy_customer)).to eq "Please add items before placing an order."
      end
    end

    context 'when several items have been added to the order' do
      it 'confirms your payment and sends a text message' do
        @test_takeaway_text.add_to_order(2, 2)
        @test_takeaway_text.add_to_order(4, 2)
        @test_takeaway_text.add_to_order(5, 1)
        Timecop.freeze(Time.new(2021, nil, nil, 18, 15))
        expect(@test_takeaway_text.place_order(dummy_customer)).to eq dummy_text
      end
    end
  end
end

TEST_MENU_DISPLAY_STRING = "MENU\n1. Spicy Edamame  Price: £4.20\n2. Salt and Chilli Vat Chicken Strips  Price: £5.20\n3. Tempura Seaweed Fish  Price: £8.00\n4. Space Whale Sashimi  Price: £16.00\n5. Venerable Dragon Roll  Price: £9.80"

TEST_ORDER_1_DISPLAY_STRING = "YOUR ORDER\n\n1. Salt and Chilli Vat Chicken Strips  Price: £5.20  Qty: 2  Sub: £10.40\n2. Space Whale Sashimi  Price: £16.00  Qty: 2  Sub: £32.00\n3. Venerable Dragon Roll  Price: £9.80  Qty: 1  Sub: £9.80\n\nTOTAL: £52.20"

REVISED_ORDER_1_DISPLAY_STRING = "Removed 1 Space Whale Sashimi from order."

TEST_CHECKOUT_MESSAGE_1 = "Your order is £52.20.\nYour address is: 72 Reunification Avenue, New Tokyo, UNC, 12NE XS9\nYour number is: 08008888888\n\nPlease press PLACE ORDER to confirm."

TEST_PLACE_ORDER_CONFIRMATION = "Payment Confirmed.\nOrder placed.\nConfirmation text issued."

DUMMY_TEXT = "Thank you! Your order was placed and will be delivered by 19:15"

FAKE_ADDRESS = { address: '72 Reunification Avenue, New Tokyo, UNC', post_code: '12NE XS9' }

FAKE_NUMBER = '08008888888'

FAKE_PAYMENT = { type: 'credit_card', number: 0001_1100_1010_1000, expiry_date: '12/77', ccc: 888 }
