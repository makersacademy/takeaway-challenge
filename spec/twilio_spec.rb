require 'twilio'

describe TwilioClient do
  let(:twilio_client) { TwilioClient.new }

  context 'initialize' do
    describe "#client" do
      it 'successfully instantiates the TwilioClient class' do
        expect(twilio_client).to be_instance_of(TwilioClient)
      end

      it { is_expected.to respond_to(:client) }
    end
  end
end
