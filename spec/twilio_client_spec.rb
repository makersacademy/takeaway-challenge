describe TwilioClient do

  subject(:client) {described_class.new}

  describe '.notify' do
    it 'responds to notify' do
      expect(client).to respond_to(:notify).with(1).argument
    end
  end

end
