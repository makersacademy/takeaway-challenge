require 'order'

ORDER_SUMMARY = <<~ORDER.freeze
  Your current order:

  Beef burger: 14
  Fries: 4
  Milkshake: 5

  Order total: 23
ORDER

describe Order do
  subject (:order) { Order.new }

  let (:actual_order) do 
    [{ name: "Beef burger", price: 14 },
      { name: "Fries", price: 4 },
      { name: "Milkshake", price: 5 }]
  end
    
  it 'is an order' do
    expect(order).to be_an Order
  end

  describe '#summary' do
    it { is_expected.to respond_to(:summary) }

    context 'when the order is empty' do
      it 'is not given' do
        expect { order.summary }.to raise_error "Your order is empty"
      end
    end

    context 'when there is an order' do
      before do
        actual_order.each do |item|
          order.add(item)
        end
      end

      specify { expect { order.summary }.to output(ORDER_SUMMARY).to_stdout }
    end
  end
end
