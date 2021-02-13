require 'takeaway'

describe Takeaway do
  let(:menu) { [
    { item: 'Marinara', price: 7.50 },
    { item: 'Margherita', price: 8.95 },
    { item: 'Bufala DOP', price: 11.25 }] }

  it 'contains collection of available' do
    expect(subject).to respond_to(:menu)
  end

  describe '#browse' do
    it 'prints a list of all available dishes with prices' do
      expect { subject.browse }.to output.to_stdout
    end
  end

  describe '#start_order' do
    it 'should instanciate a new order' do
      my_order = subject.start_order
      expect(my_order).to be_an_instance_of Order
    end
  end

  describe '#add' do
    it 'should take 1 to 3 arguments' do
      expect(subject).to respond_to(:add).with(1..3).arguments
    end
    it 'should add the items to order' do
      my_order = Order.new
      subject.add(0, 3, my_order)
      expect(my_order.items_ordered).to contain_exactly('Marinara', 'Marinara', 'Marinara')
    end
    it 'should add the item prices to order' do
      my_order = Order.new
      subject.add(0, 3, my_order)
      expect(my_order.items_price).to contain_exactly(7.50, 7.50, 7.50)
    end
  end

end
