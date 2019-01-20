require 'order'

RSpec.describe Order do
  let(:subject){ Order.new }

  it 'initializes an empty order list'do
    expect(subject.order_list).to be_empty
  end
  describe '#take_order' do
    it 'takes a dish' do
      expect(subject).to respond_to(:take_order).with(2)
    end
    it 'adds the item to the order_list' do
      expect(subject.take_order("pizza", 2)).to include("pizza" => 2)
    end
  end
  # describe '#calculate_bill' do
  #   it 'gets the bill total' do
  #     subject.take_order('pizza')
  #     subject.take_order('kebab')
  #     expect(subject.calculate_bill).to eq 'Your bill total is £14.98'
  #   end
  # end
end
