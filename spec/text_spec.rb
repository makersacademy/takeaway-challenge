require 'text'

describe Text do
  subject(:text) { described_class.new }
  let(:client){double :Client, messages: messages}
  let(:messages){double :message, create: nil}

  it {is_expected.to respond_to(:send_confirmation).with(1).argument}
  
  describe '#send_confirmation' do
    it 'sends confirmation text' do
      expect{ (messages).to receive(:create).with(3).arguments }
    end
  end
end
