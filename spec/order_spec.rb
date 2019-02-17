require_relative '../lib/order'

describe Order do
  let(:order) { Order.new }

  describe '.add' do
    it 'selected dishes are added to order' do
      expect { order.add(10, 2) }
        .to change { order.selected_dishes }
        .to include({ quantity: 2, dish: "Small Fries", price: 1.00, subtotal: 2.00 })
    end
  end

  before do
    order.add(4, 1)
    order.add(5, 1)
    order.add(10, 2)
  end

  describe '.total' do
    it 'returns the total' do
      expect(order.total).to eq 5.35
    end
  end

  describe '.print_total' do
    it 'outputs the total cost of the order' do
      expect(order.print_total).to eq "\u00A35.35"
    end
  end

  describe '.review' do
    it 'displays order summary' do
      expected_output = ""
      
      expected_output << "Order Summary:\n\n"
      expected_output << "Veggie Burger\n"
      expected_output << "\u00A32.75 each, x1, subtotal: \u00A32.75\n\n"
      expected_output << "Small Lemonade\n"
      expected_output << "\u00A30.60 each, x1, subtotal: \u00A30.60\n\n"
      expected_output << "Small Fries\n"
      expected_output << "\u00A31.00 each, x2, subtotal: \u00A32.00\n\n"
      expected_output << "             GRAND TOTAL: \u00A35.35"

      expect { order.review }.to output { expected_output }.to_stdout
    end
  end

end
