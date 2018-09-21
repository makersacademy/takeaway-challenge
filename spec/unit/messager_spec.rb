require 'messager'

describe Messager do
  context '#send_message' do
    subject(:messager) { Messager.new }
    let(:mockmessage) { double :message }
    let(:client) { double :client, create: true }
    let(:messages) { double :messages }

    before do
      expect(messager).to receive(:send_message)
    end
    it "Should send message" do
      expect { messager.send_message(mockmessage) }.to_not raise_error
    end
  end
end
