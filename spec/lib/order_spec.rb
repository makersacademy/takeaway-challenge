require 'order'


describe Order do
  subject(:order) { described_class.new }
  let(:array) { ["food £4.32","other £5.34","more £2.34"] }
  let(:naughty_array) { ["food £-4.32","other £-5.34","more £-2.34"] }

  describe '#sum_items' do
    it 'can sum items of an order' do
      expect(order.sum_items(array)).to eq '12.00'
    end
    it 'throws an error if sum is incorrect' do
      message = "Error! Sum total is incorrect!"
      expect{order.sum_items(naughty_array)}.to raise_error message
    end
  end

  describe '#send_receipt' do
    it 'send items to receipt class to get receipt' do
      order.sum_items(array)
      expect(order.send_receipt).to respond_to(:split)
    end
  end
end



