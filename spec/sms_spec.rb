require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  describe "#deliver_sms" do
    it "should deliver a text message" do
      expect(sms).to respond_to(:deliver_sms)
    end
  end

  to test there is only one public method that is deliver_sms
  RSpec.describe SMS do
    describe "#deliver_sms" do
      it '' do
        #set up
        client = double("represents a client")
        messages = double('represents messages')
        info = { 'body' => 'data' }
        #expectation
        # so the expectation here is a bit odd you are not really testing the result you are actually testing that the chain of evens happens when you call deliver_sms

        expect(client).to receive(:messages).and_return(messages)
        expect(messages).to receive(:create).with(info)
        sms = SMS.new(client)
        #execute
        sms.deliver_sms
      end
    end
  end

end

#4 phases of testing

# set up
# execute
#assertion
#destroy everything


#alternativelu using allow

#set up
client = double("represents a client")
messages = double('represents messages')
info = { 'body' => 'data' }
#expectation
# so the expectation here is a bit odd you are not really testing the result you are actually testing that the chain of evens happens when you call deliver_sms

allow(client).to receive(:messages).and_return(messages)
allow(messages).to receive(:create).with(info).and_return('we made it')
sms = SMS.new(client)
#execute
expect(sms.deliver_sms).to eq('we made it')
end
