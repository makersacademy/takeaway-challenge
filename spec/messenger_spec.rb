describe Messenger do

  let(:messenger) { described_class.new }

  describe 'Initialization' do
    it { is_expected.to be_a Messenger }

    it 'has an account SID' do
      expect(messenger.sid).to eq ENV['ACCOUNT_SID']
    end

    it 'has an auth token' do
      expect(messenger.auth).to eq ENV['AUTH_TOKEN']
    end

    it 'has a phone number to send from' do
      expect(messenger.from).to eq ENV['FROM']
    end

    it 'has a phone number to send to' do
      expect(messenger.to).to eq ENV['TO']
    end
  end
end
