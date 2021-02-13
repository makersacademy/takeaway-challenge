require 'takeaway'

describe Takeaway do

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
      subject.add(1, 3, my_order)
      expect(my_order.items_ordered).to contain_exactly('Marinara', 'Marinara', 'Marinara')
    end
    it 'should add the item prices to order' do
      my_order = Order.new
      subject.add(1, 3, my_order)
      expect(my_order.items_price).to contain_exactly(7.50, 7.50, 7.50)
    end
  end

  describe '#checkout' do
    it 'should return the bill total for the order' do
      # my_order = Order.new
      # subject.add(2, 2, my_order)
      # expect(subject.checkout(my_order)).to eq(17.9)
      # expect { subject.checkout(my_order) }.to output.to_stdout
    end
  end

end
