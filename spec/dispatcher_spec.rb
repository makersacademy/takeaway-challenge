require 'dispatcher'

describe Dispatcher do

  subject(:dispatcher) { described_class.new(order_class.new)}
  let(:order_class) {double :order_class, new: new_order}
  let(:new_order) {double :new_order, start_order: nil, sum: 39, list: [[:chicken,1],[:spinach,3],[:potatoes,2]]}


  describe "#initialize" do

    it 'should set the current order to nil' do
      expect(dispatcher.current_order).to eq nil
    end

    it 'should have an empty order history' do
      expect(dispatcher.order_history).to eq []
    end

  end

  describe "#create_new_order" do

    before(:each) do
      @sum = 34
      @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
    end

    it 'should create new Order object and send it the selected dishes' do
      dispatcher.create_new_order(@list,@sum)
      expect(new_order).to have_received(start_order).with(@list,@sum)
    end

  end

  describe '#close_order' do

    before(:each) do
      @sum = 34
      @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
      dispatcher.create_new_order(@list,@sum)
      dispatcher.close_order
    end

    it 'should update the order history' do
      expect(dispatcher.order_history).to include new_order
    end

    it 'should reset current order to nil' do
      expect(dispatcher.current_order).to eq nil
    end

  end

end
