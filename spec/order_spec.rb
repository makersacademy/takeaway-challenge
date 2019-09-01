require 'order'

describe Order do
  let(:dish1) { double(:dish, :name => 'name', :price => 12) }
  let(:dish2) { double(:dish, :name => 'name', :price => 5) }
  let(:dish3) { double(:dish, :name => 'name', :price => 9) }
  let(:dishes_list) { [dish1, dish2, dish3] }
  let(:menu) { double(:menu, :give_list => dishes_list) }
  subject(:order) { Order.new(menu) }

  it { is_expected.to respond_to :add_to_cart }
  it { is_expected.to respond_to :total }

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

  context '#total' do
    it 'returns the total to be charged' do
      2.times { subject.add_to_cart(1) }
      expect(subject.total).to eq 2 * dishes_list[0].price
    end
  end

  context '#print_receipt' do
    it 'prints a receipt' do
      subject.add_to_cart(1)
      subject.add_to_cart(2)
      subject.add_to_cart(3)
      expect { subject.print_receipt }
        .to output("Thank you for your order!\n" +
          "#{dish1.name} #{dish1.price}£\n" +
          "#{dish2.name} #{dish2.price}£\n" +
          "#{dish3.name} #{dish3.price}£\n" +
          "To be charged: #{subject.total}£\n").to_stdout
    end
  end
end
