require 'order'

describe Order do
  
  subject { described_class.new }
  
  before(:each) do
    @order_item_class = class_double("OrderItem")
    @order_item = instance_double("OrderItem")
    allow(@order_item).to receive(:description) { "Fake dish x 3" }
    allow(@order_item).to receive(:price) { 9.99 }
  end

  it 'is initialized with state :in_progress' do
    expect(subject.state).to eq :in_progress
  end

  describe '#add_item' do
    it 'creates new order item with the given dish and quantity' do
      allow(OrderItem).to receive(:new).with("Fake dish", 3).and_return(@order_item)
      subject.add_item "Fake dish", 3
      expect(subject.instance_variable_get(:@items)).to eq [@order_item]
    end 

    it 'returns an info string' do
      allow(OrderItem).to receive(:new).with("Fake dish", 3).and_return(@order_item)
      expect(subject.add_item "Fake dish", 3).to eq "Added to order: Fake dish x 3"
    end
  end

  describe '#calculate_total' do
    it 'returns the total of the order' do
      allow(OrderItem).to receive(:new).with("Fake dish", 3).and_return(@order_item)
      subject.add_item "Fake dish", 3
      expect(subject.calculate_total).to eq 9.99
    end
  end
end
