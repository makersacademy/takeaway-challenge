require 'SMS'
describe SMS do
    subject(:sms) {described_class.new(client: client)}

    let(:client) {double(:client, messages: messages)}
    let(:messages) {spy(:messages)}

    let(:config) do 
        {
            account_sid: "123",
            auth_token: "23fds",
            from: "+123",
            to: "234",
            body: "Thank you! Your order will be delivered before %s"
        }
    end
    
    
    it "delivers an SMS" do 
        args = {
            from: config[:from],
            to: config[:to],
            body: "Thank you! Your order will be delivered before 18.52"
        }

        allow(Time).to receive(:now).and_return(Time.parse("17:52"))
        allow(messages).to receive(:create).with(args)
        sms.deliver
    end
end 