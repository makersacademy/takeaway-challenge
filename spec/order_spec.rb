require 'order'

describe 'Order' do
  let(:name) { double("name") }
  let(:price) { double("price") }
  let(:dish) { Dishes.new(name, price) }
  let(:takeaway) { Takeaway.new }
  let(:subject) { Order.new }
  let(:add) { true }

  describe 'an instance of order' do
    it { expect(subject).to be_an_instance_of(Order) }
    it { expect(subject).to respond_to(:order_list) }
    it { expect(subject).to respond_to(:add_to_order).with(1).argument }
  end

  describe '#order_list' do
    it 'starts empty' do
      expect(subject.order_list).to eq({})
    end
  end

  describe '#add_to_order' do
    it 'selects from takeaway.menu' do
      expect(subject.add_to_order(add)).to include({:name => price})
    end
  end
end