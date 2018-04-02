require 'order'

describe Order do
  
  subject(:order) { described_class.new }
  subject(:empty_order) { described_class.new }
  
  before(:each) do
    @order_item = instance_double("OrderItem")
    allow(@order_item).to receive(:description) { "Fake dish x 3" }
    allow(@order_item).to receive(:price) { 9.99 }
    allow(@order_item).to receive(:id) { 'A8888' }
    allow(OrderItem).to receive(:new).with("Fake dish", 3).and_return(@order_item)
    order.add_item "Fake dish", 3
  end

  it 'is initialized with state :in_progress' do
    expect(order.state).to eq :in_progress
  end

  describe '#add_item' do
    it 'creates new order item with the given dish and quantity' do
      empty_order.add_item "Fake dish", 3
      expect(empty_order.instance_variable_get(:@items)).to eq [@order_item]
    end 

    it 'returns an info string' do
      expect(order.add_item "Fake dish", 3).to eq "Added to order: Fake dish x 3"
    end
  end

  describe '#remove_item' do
    it 'raises an error if item not found' do
      expect { order.remove_item 'ABCDE' }.to raise_error Order::MESSAGES[:not_found]
    end

  it 'removes a matching item' do
    order.remove_item 'A8888'
    expect(order.instance_variable_get(:@items)).not_to include(@order_item)
  end
  end
      
  describe '#calculate_total' do
    it 'returns the total of the order' do
      empty_order.add_item "Fake dish", 3
      expect(order.calculate_total).to eq 9.99
    end
  end

  describe '#complete!' do
    it 'sets the state of order to :complete' do
      expect { order.complete! }.to change { order.state }.from(:in_progress).to(:complete)
    end
  end

  describe '#describe' do
    it 'passes info to OrderPrinter, returns a string with order info' do
      message = "Order summary\n#{order.instance_variable_get(:@items).map(&:description).join("\n")}\nTotal: #{order.calculate_total}\nState: #{order.state}"
      allow_any_instance_of(OrderPrinter).to receive(:pretty_print).and_return(message)
      expect(order.describe).to eq message
    end
  end
end
