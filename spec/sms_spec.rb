require 'sms'

describe SMS do
    subject(:sms) { described_class.new(config, client: client) }

    let(:client) { double(:client) }

    let(:config) do
        {
            account_sid: "123",
            auth_token: "42mdk"
        }
    end 


    let(:client) { double(:client) }
    it 'delivers an SMS with the estimated time' do
        sms.deliver 
    end
end 