fdescribe Message_handler do
  before(:each) do
    stub_request(:any, /api.twilio.com/).
         to_return(status: 200, body: "", headers: {})
  end

  let(:order) { double :order, category: "Pizza", total: 30.00 }

  describe '#initialize' do

    it 'gets the environment variables' do
      expect(subject.instance_variable_get(:@account_sid)).not_to be_nil
      expect(subject.instance_variable_get(:@auth_token)).not_to be_nil
    end

  end

  describe '#send_message' do

    it 'sends a message', :request do
      allow(subject).to receive(:send_sms).with(anything).and_return({ status: 200 })
      response = subject.send_message(order)
      expect(response[:status]).to eq 200
    end

  end

end
