require 'order'

describe Order do
  let(:order) { described_class.new }  
  let(:menu) { double :menu }
  let(:order_choice) { double :order_choice }

  it 'creates a new order' do
    expect(Order.new).to be_instance_of Order
  end

  it 'initalizes with an empty customer basket' do
    expect(Order.new.customer_basket).to eq []
  end

  context ' #select_items' do
    it 'should responds to #select_items' do
      expect(subject).to respond_to(:select_items).with(1).argument
    end

    it 'raises error if the customer enters an invalid number' do
      expect { subject.select_items(5) }.to raise_error "Invalid number, please choose again"
    end

    it 'returns the correct item name when given customers choice' do
      allow(menu).to receive(:customer_choice)
      order.select_items(2)
      expect(order.customer_basket).to include({ :item => "Veggie Lasagna", :item_number => 2, :price => 5 })
    end
  end

  describe '#customer_order' do
    it 'should output the order in the correct format' do
      order.select_items(2)
      order.customer_order_summary
      expect(subject.customer_order_summary).to eq(subject.customer_basket)
    end
  end

  describe '#subtotal' do
      
    it { is_expected.to respond_to(:subtotal) }

    xit 'returns sum of all items in customer basket' do
      customer_basket = [2, 4]
      order.select_items(2)
      order.select_items(1)
      order.customer_order_summary
      order.subtotal
      subtotal_test = order.subtotal
      expect(order.subtotal).to eq(subtotal_test)
    end
  end
end

   