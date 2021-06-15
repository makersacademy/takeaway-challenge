require 'sms'

describe SMS do
   subject(:sms)  { described_class.new(config, client: client) }

   let(:client) { double(:client, messages: message) }
   let(:messages) { double(:messages) }

   let(:config) do
    {
        account_sid: "123",
        auth_token: "23fds",
        from: "+123",
        to: "+234",
        body: "Thank you! Your order will be delivered before %s"
    }



    it "delvers with the estimate time" do
        args = {
            form: config[:from],
            to: config[:to],
            body: "hank you! Your order will be delivered before 18:52"
        }

    sms.deliver
    expect(messages).to receive(:create).with(args)
    end
end