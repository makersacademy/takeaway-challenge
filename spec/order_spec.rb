require 'order'

describe Order do
  let(:selected_item) { { name: "item_two", price: 5.0, quantity: 1 } }

  it 'has an empty order by default' do
    expect(subject.current).to eq([])
  end

  context 'after adding items' do
    before(:each) do
      subject.add(selected_item, 1)
    end

    describe '#add' do
      context 'when items are available' do
        context 'and not in order already' do
          it 'adds item to order' do
            expect(subject.current.last).to eq(selected_item)
          end
        end

        context 'and in order already' do
          it 'updates the quantity' do
            subject.add(selected_item, 1)
            expect(subject.current.first[:quantity]).to eq(2)
          end
        end
      end
    end
    
    it 'displays the order with quantity and total prices' do
      expect(subject.display).to eq("1 x item_two = £5.0")
    end
    
    it 'displays the total' do
      expect(subject.total).to eq("£5.0")
    end

    it 'completes the order and confirms the total' do
      expect(subject.complete).to eq("Order has been placed for £5.0")
    end
  end

  it 'returns the time in 1 hour' do
    time_in_an_hour = "#{Time.now.hour + 1}:#{Time.now.min}"
    expect(subject.delivery_time).to eq(time_in_an_hour)
  end
end
  