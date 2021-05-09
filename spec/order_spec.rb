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
  end
end
  