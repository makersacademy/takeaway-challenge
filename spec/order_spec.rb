require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  it 'creates new instances of Order class' do
    expect(order).to be_an_instance_of(Order)
  end

  describe '# add' do
    it 'adds an item to order' do
      order.add({'Anchoa' => '12.50'})
      expect(order.current_order.length).to eq 1
    end
  end

  describe '# show_current_order' do
    context 'when no order has been placed' do
      it 'displays an empty string' do
        expect(order.show_current_order).to eq ""
      end
    end
    context 'when dishes have been ordered, it displays those dishes' do
      it 'displays a formatted list of the ordered items' do
        order.add({'Anchoa' => '12.50'})
        order.add({'Marinara' => '7.50'})

        expect(order.show_current_order).to eq "Anchoa, £12.50\nMarinara, £7.50" 
      end
    end
  end
end