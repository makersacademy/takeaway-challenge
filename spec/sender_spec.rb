require 'sender'

describe Sender do
  let(:mocktwilio)  { double(:mocktwilio) }
  let(:mockclient)  { double(:mockclient) }
  let(:mocktime)    { double(:mocktime) }
  subject           { described_class.new(mocktwilio, mocktime, mockclient) }

  describe 'instantiation' do
    it 'account and auth are correct' do
      expect(Sender::ACCOUNT_SID).to eq('ACd319a65e921b7f3a98db79f2f6a2af51')
      expect(Sender::AUTH_TOKEN).to eq('c00d3e818687c0d2b1121179cecfece4')
    end
  end

  describe '#send' do
    before do
      allow(mockclient).to receive_message_chain(:api, :account, :messages, :create)
      allow(subject).to receive(:delivery_time)
    end
    it 'calls API' do
      expect(subject.client).to receive_message_chain(:api, :account, :messages, :create)
      subject.send
    end
  end

  describe '#text' do
    before { allow(subject).to receive(:delivery_time).and_return "20:00" }

    it 'returns message with time' do
      response = "Thank you! Your order was placed and will be delivered before 20:00"
      expect(subject.text).to eq(response)
    end
  end

  describe '#delivery_time' do
    before do
      allow(mocktime).to receive(:now).and_return(Time.new(2018, 6, 21, 11, 30, 0))
    end

    it 'adds one hour and returns string of hour and minutes' do
      expect(subject.delivery_time).to eq("12:30")
    end
  end
end
