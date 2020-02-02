require 'sms'

describe SMS do
  let(:from_num) { '+44777' }
  let(:to_num) { '+44778' }
  subject(:sms) { described_class.new('123', '456', from_num, to_num) }
  
  describe "#send" do
    it 'responds to the send message' do
      expect(subject).to respond_to(:send)
    end

    it 'sends a message' do
      expect(subject).to receive(:send)
      subject.send
    end
  end
end
