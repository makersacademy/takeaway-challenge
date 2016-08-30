require 'sum_items'


describe SumItems do
  subject(:order) { described_class.new }
  let(:array) { ["food £4.32","other £5.34","more £2.34"] }
  let(:naughty_array) { ["food £-4.32","other £-5.34","more £-2.34"] }
  let(:timed_rec)  { double(:timed_rec, receipt: "receipt")}
  let(:text)  { double(:text, send_text: "receipt,time")}

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
    it 'send items to receipt class to print receipt' do
      order.sum_items(array)
      expect(order.send_receipt(receipt_doc: timed_rec)).to eq "receipt"
    end
  end

  describe '#send_order_to_text' do
    it 'send items to text class to text receipt' do
      order.sum_items(array)
      expect(order.send_order_to_text(text_doc: text)).to eq "receipt,time"
    end
  end
end



