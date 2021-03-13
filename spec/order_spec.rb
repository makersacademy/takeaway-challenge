require 'order'

describe Order do
  let(:test_order) { Order.new(menu_double) }
  let(:menu_double) { instance_double('Menu', access: TEST_MENU_ACCESS) }
  let(:test_order_1) { TEST_ORDER_1_DISPLAY_STRING }
  let(:revised_order_1) { REVISED_ORDER_1_DISPLAY_STRING }

  describe '#add_to_order' do
    it 'adds an item to the order' do
      expect(test_order.add_to_order(4, 1)).to eq({ 'Space Whale Sashimi' => 1 })
    end
  end

  describe '#remove_from_order' do
    it 'removes an item from the order' do
      test_order.add_to_order(2, 2)
      test_order.add_to_order(4, 2)
      test_order.add_to_order(5, 1)
      expect(test_order.remove_from_order(4, 1)).to eq revised_order_1
    end
  end

  describe '#display_current_order' do
    context 'when no items have been added to order' do
      it "displays an empty list" do
        expect(test_order.display_current_order).to eq "You have not selected any items."
      end
    end

    context 'when several items have been added to order' do
      it "displays your order with the quantities, prices per item, subtotal and the Total" do
        test_order.add_to_order(2, 2)
        test_order.add_to_order(4, 2)
        test_order.add_to_order(5, 1)
        expect(test_order.display_current_order).to eq test_order_1
      end
    end
  end

  describe '#current_cost' do
    it 'displays current cost of order' do
      test_order.add_to_order(2, 2)
      test_order.add_to_order(4, 2)
      test_order.add_to_order(5, 1)
      expect(test_order.current_cost).to eq '52.20'
    end
  end
end

TEST_ORDER_1_DISPLAY_STRING = "YOUR ORDER\n\n1. Salt and Chilli Vat Chicken Strips  Price: £5.20  Qty: 2  Sub: £10.40\n2. Space Whale Sashimi  Price: £16.00  Qty: 2  Sub: £32.00\n3. Venerable Dragon Roll  Price: £9.80  Qty: 1  Sub: £9.80\n\nTOTAL: £52.20"

REVISED_ORDER_1_DISPLAY_STRING = "Removed 1 Space Whale Sashimi from order."

TEST_MENU_ACCESS = [
  { 'Spicy Edamame' => 4.20 },
  { 'Salt and Chilli Vat Chicken Strips' => 5.20 },
  { 'Tempura Seaweed Fish' => 8.00 },
  { 'Space Whale Sashimi' => 16.00 },
  { 'Venerable Dragon Roll' => 9.80 }
]
