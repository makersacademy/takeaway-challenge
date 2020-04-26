require 'order_manager'

describe OrderManager do

  let(:restaurants) { double() }
  let(:order_instance) { double(add_item: nil, confirm_order: nil) }
  let(:order_class) { double(new: order_instance) }

  describe '#get_restaurants' do
    it 'loads restaurants on a restaurant object' do
      allow(restaurants).to receive(:find_restaurants)
      expect(restaurants).to receive(:load_restaurants)
      subject.get_restaurants(restaurants)
    end

    it 'finds a list of restaurants' do
      allow(restaurants).to receive(:load_restaurants)
      expect(restaurants).to receive(:find_restaurants)
      subject.get_restaurants(restaurants)
    end
  end

  describe '#new_order' do
    it 'finds a matching menu' do
      subject = described_class.new(order_class)
      expect { subject.new_order('Italian','Pizza', 1, 5) }.to change { subject.menu }.to be_a_kind_of(Menu)
    end

    xit 'adds items from the menu to an order' do
      subject.new_order("Italian", "Pizza", 1, "Lasagne", 2, 26)
      expect(subject.order.order_items.count).to eq(2)
    end
  end

  describe '#add_items' do
    it 'adds items from the menu to an order' do
      subject.load_menu("Italian")
      subject.create_order
      subject.add_items(["Pizza", 1, "Lasagne", 2])
      expect(subject.order.order_items.count).to eq(2)
    end
  end

  describe '#load_menu' do
    it 'finds a matching menu' do
      expect { subject.load_menu('Italian')}.to change { subject.menu }.to be_a_kind_of(Menu)
    end
  end

  describe '#create_order' do
    it 'created a new order with the supplied menu' do
      expect(subject.create_order).to be_a_kind_of(Order)
    end
  end

  describe '#finalize_order' do
    it 'confirms order' do
      subject = described_class.new(order_class)
      subject.new_order("Italian", "Pizza", 1, "Lasagne", 2, 26)
      expect(subject.order).to receive(:confirm_order)
      subject.finalize_order(26)
    end
  end
end
