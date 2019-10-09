require 'orders'

describe Orders do
  let(:menu) { double :menu, items: { pizza: 6, burger: 5, fries: 3, milkshake: 3, soda: 1 }
  }

  let(:order1) { [{ quantity: 2, item: "pizza", cost: 12 },
    { quantity: 1, item: "burger", cost: 5 }]
  }
  let(:order2) { [{ quantity: 4, item: "milkshake", cost: 12 },
    { quantity: 4, item: "fries", cost: 12 }]
  }

  let(:test_receipt) { "RECEIPT:\n1 x Burger - £5\nTOTAL - £5" }
  let(:digital_till) { double :digital_till, verify_total: true, itemised_receipt: test_receipt }
  let(:digital_till_class) { double :digital_till_class, new: digital_till }

  subject(:orders) { described_class.new(menu: menu, dgt_class: digital_till_class) }

  describe '#add_food' do
    it 'saves items, quantities and totals per item as a hash in order array' do
      orders.add_food("pizza 2, burger 1")
      expect(orders.current_order).to eq order1
    end

    it 'saves items, quantities and totals per item as a hash in order array' do
      orders.add_food("milkshake 4, fries 4")
      expect(orders.current_order).to eq order2
    end
  end

  describe '#submit_order' do
    it 'raises an error if the totals do not match' do
      allow(digital_till).to receive(:verify_total).and_return(false)
      orders.add_food("pizza 2, burger 1")
      expect { orders.submit_order(10) }.to raise_error("Total does not match items")
    end

    it 'saves current order receipt to the order history array' do
      orders.add_food("milkshake 4, fries 4")
      orders.submit_order(24)
      expect(orders.history).to include test_receipt
    end
  end
end
