require 'order'

describe Order do
  it 'has an empty order by default' do
    expect(subject.current).to eq([])
  end

  it 'displays the order' do
    expect(subject.display).to eq("Empty order")
  end

  describe '#add' do
    let(:selected_item) {{ name: "item_two", price: 5.0, quantity: 1 }}
    context 'when items are available' do
      context 'and not in order already' do
        it 'adds item to order' do
          subject.add(selected_item, 1)
          expect(subject.current.last).to eq(selected_item)
        end
      end
      context 'and in order already' do
        it 'updates the quantity' do
          subject.add(selected_item, 1)
          subject.add(selected_item, 1)
          expect(subject.current.first[:quantity]).to eq(2)
        end
      end
    end
  end

  it 'displays the total' do
    completed_order = Order.new([{ name: "item_two", price: 5.0, quantity: 5 }])
    expect(completed_order.total).to eq("£25.0")
  end
end
