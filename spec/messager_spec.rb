require 'messager'

describe Messager do
  describe '#send' do
    let(:client) { double :client }

    before do
      allow(Twilio::REST::Client).to receive(:new).and_return client
    end

    it 'creates the message on the Twilio client' do
      expect(client).to receive_message_chain('messages.create') do |params|
        expect(params[:to]).to eq '07712987654'
        expect(params[:body]).to eq 'Hello'
      end
      subject.send_message '07712987654', 'Hello'
    end
  end
end
