require 'checkout_message'

describe CheckOutMessage do

  let(:summary) { double :"Pizza x 2, Fried Chicken x 3 = £19" }
  let(:order) { double :order, add: 'item', summary: summary, total: 19 }
  let(:order_class) { double :order, new: order }
  let(:send_text) { double :send_text }
  let(:client_class) { double :client_class, new: client }
  let(:client) { double :client, messages: message }
  let(:message) { double :message, create: send_message }
  let(:send_message) { double :send_message }

  describe '#send_text' do
    it "sends text that confirms order and time it will arrive" do
      subject = CheckOutMessage.new(client_class)
      expect(subject.send_text).to eq send_message
    end
  end

end
