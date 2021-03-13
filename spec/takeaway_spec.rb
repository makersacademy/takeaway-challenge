require 'takeaway'

describe Takeaway do
  let(:test_takeaway) { Takeaway.new }
  let(:test_menu) { "MENU\n1. Spicy Edamame  Price: £4.20\n2. Salt and Chilli Vat Chicken Strips  Price: £5.20\n3. Tempura Seaweed Fish  Price: £8.00\n4. Space Whale Sashimi  Price: £16.00\n5. Venerable Dragon Roll  Price: £9.80" }
  let(:empty_order) { [] }
  let(:test_order_1) { "YOUR ORDER\n\n1. Salt and Chilli Vat Chicken Strips  Price: £5.20  Qty: 2  Sub: £10.40\n2. Space Whale Sashimi  Price: £16.00  Qty: 2  Sub: £32.00\n3. Venerable Dragon Roll  Price: £9.80  Qty: 1  Sub: £9.80\n\nTOTAL: £52.20" }

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
end
