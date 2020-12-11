require 'order'

describe Order do
  let(:order) { Order.new }
  let(:dishes_hash) { { 'chicken tikka massala' => 6, 'hawaian pizza' => 6, 'beef noodles' => 5 } }
  let(:menu_double) { double :menu, dishes: dishes_hash }
  let(:menu_class_double) { double :menu_class, new: dishes_hash }
  let(:plate) { "chicken tikka massala" }
  let(:quantity) { 2 }

  it 'creates an instance of the Order class' do
    expect(order).to be_instance_of(Order)
  end

  it 'begins with an empty trolley' do
    expect(order.trolley).to be_empty
  end

  describe '.add_item method' do
    it 'takes two arguments' do
      expect(order).to respond_to(:add_item).with(2).arguments
    end

    it 'adds an item to the trolley' do
      expect { order.add_item(plate, quantity) }.to change{ order.trolley.length }.by(1)
    end
  end

  describe '.trolley_summary' do
    it 'gives total summary for each item ordered' do
      order.add_item(plate, quantity)
      expect(order.trolley_summary(menu_double)).to eq('chicken tikka massala, £12')
    end
  end

  describe '.total_bill method' do
    it 'gives the total bill' do
      order.add_item(plate, quantity)
      expect(order.total_bill(menu_double)).to eq('Total: £12')
    end
  end
end
