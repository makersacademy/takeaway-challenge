require 'messager'

describe Messager do
  subject(:messager) { described_class.new(client_class) }

  let(:client_messages) { double('client messages', create: "message") }
  let(:client_instance) { double('client instance', messages: client_messages) }
  let(:client_class) { double('client_class', new: client_instance) }

  describe '#confirm_order_by_text' do
    it 'should be able to try to send a text message' do
      expect(messager).to respond_to(:confirm_order_by_text)
    end

    it 'calls methods' do
      expect(messager.confirm_order_by_text("YO")).to eq 'message'
    end
  end
end
