require 'order'

describe Order do
  let(:dish1) { double(:dish, :name => 'name', :price => 'price') }
  let(:dish2) { double(:dish, :name => 'name', :price => 'price') }
  let(:dish3) { double(:dish, :name => 'name', :price => 'price') }
  let(:dishes_list) { [dish1, dish2, dish3] }
  let(:menu) { double(:menu, :give_list => dishes_list) }
  subject(:order) { Order.new(menu) }

  it { is_expected.to respond_to :add_to_cart }

  context '#add_to_cart' do
    it 'adds selected dishes to cart' do
      subject.add_to_cart(1)
      expect(subject.cart).to include(dishes_list[0])
    end

    it 'raises error when the index not valid' do
      expect { subject.add_to_cart(0) }.to raise_error(Order::INVALID_INDEX)
    end
    it 'raises error when the selection is not available' do
      expect { subject.add_to_cart(dishes_list.length + 1) }.to raise_error(Order::INVALID_INDEX)
    end
    it 'raises error when not given a number' do
      expect { subject.add_to_cart('0') }.to raise_error(Order::INVALID_INDEX)
    end
    
  end

end
