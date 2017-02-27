describe TwilioClient do

  sid = '123456'
  auth = 'abcde'
  twil_num = '123455'
  cust_num = '123456'
  subject(:client) {described_class.new}

  describe '.notify' do
    it 'responds to notify' do
      expect(client).to respond_to(:notify).with(1).argument
    end
  end

end
