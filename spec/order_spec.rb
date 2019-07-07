require 'order'

describe Order do
  let(:summary) { double :"Pizza x 2, Fried Chicken x 3 = £19" }
  let(:order) { double :order, add: 'item', summary: summary, total: 19 }
  let(:order_class) { double :order, new: order }
  let(:send_text) { double :send_text }
  let(:client_class) { double :client_class, new: client }
  let(:client) { double :client, messages: message }
  let(:message) { double :message, create: send_message }
  let(:send_message) { double :send_message }
  describe '#add' do
    it 'adds item to order' do
      subject = Order.new
      subject.add('chicken', 1)
      expect(subject.items).to eq [{ :amount => 1, :item => "chicken" }]
    end
  end
  describe '#summary' do
    it "returns summary of order" do
      subject = Order.new
      subject.add('fried chicken', 1)
      expect(subject.summary).to eq "Fried chicken x 1 = £3"
    end
  end
  describe '#total' do
    it "a customer can add a number of items to an order" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Fried Chicken", 3)
      expect(takeaway.basket_summary).to eq summary
    end
  end
  describe '#checkout' do
    it "a customer can add a number of items to an order" do
      takeaway = TakeAway.new(order_class)
      takeaway.create_new_order
      takeaway.add("Pizza", 2)
      takeaway.add("Fried Chicken", 3)
      expect(takeaway.basket_summary).to eq summary
    end
  end
end
