require 'order'

describe 'Order' do
  subject(:order) { Order.new('pizza') }

  it 'creates new instances of Order class' do
    expect(order).to be_an_instance_of(Order)
  end

  it 'initialises with a specific menu' do
    expect(order.menu).to be_an_instance_of(Menu)
  end

  describe '# add' do
    it 'adds an item to order' do
      order.add('Anchoa')
      expect(order.current_order.length).to eq 1
    end

    it 'should only add items from the initialised menu' do
      expect { order.add('foo') }.to raise_error("Input error: This item is not on the menu.")
    end
  end

  describe '# remove' do
    context 'when current order is empty' do
      it 'raises an error' do  
        expect { order.remove('foo') }.to raise_error("User error: No items in current order.")
      end
    end

    context 'when items have been corrextly ordered' do
      before { order.add('Anchoa'); order.add('Marinara'); order.add('Anchoa'); }
      it 'raises an error if item does not exist in current order' do
        expect { order.remove('foo') }.to raise_error("Input error: Item not in current order.")
      end

      it 'correctly removes items from current order' do
        order.remove('Anchoa')
        expect(order.current_order).to eq([{"Marinara"=>"7.50"}, {"Anchoa"=>"12.50"}])
      end
    end
  end

  describe '# view_order' do
    context 'when no order has been placed' do
      it 'displays an empty string' do
        expect(order.view_order).to eq ""
      end
    end
    context 'when dishes have been ordered, it displays those dishes' do
      it 'displays a formatted list of the ordered items' do
        order.add('Anchoa')
        order.add('Marinara')

        expect(order.view_order).to eq "Anchoa, £12.50\nMarinara, £7.50" 
      end
    end
  end

  describe '# order_total' do
    it 'correctly sums the value of all items in current order' do
      order.add('Margherita')
      order.add('Cured Meat')
      order.add('Anchoa')
      order.add('Marinara')
      order.add('Anchoa')
      order.add('New Yorker')

      expect(order.order_total).to eq '£67.50'
    end
  end

  # describe '# confirm_order' do
  #   it 'creates new instance of text' do
  #     expect(order.confirm_order('user number', 'account SID', 'auth token')).to be_an_instance_of(Text)
  #   end
  # end
end