require 'order'

RSpec.describe Order do
  let(:subject){ Order.new }

  it 'initializes an empty order list'do
    expect(subject.order_list).to be_empty
  end
  describe '#take_order' do
    it 'takes a dish' do
      expect(subject).to respond_to(:take_order).with(1)
    end
    it 'adds the item to the order_list' do
      item = "pizza"
      expect(subject.take_order(item)).to include(item)
    end
  end
  describe '#calculate_bill' do
    it 'gets the bill total' do
      subject.take_order('pizza')
      subject.take_order('kebab')
      expect(subject.calculate_bill).to eq 'Your bill total is £14.98'
    end
  end
end
