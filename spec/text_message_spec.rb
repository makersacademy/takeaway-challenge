require 'text_message'

describe TextMessage do
    
    subject(:text_message)  { described_class.new(client_details, client: client) }
    
    let(:client)            { double(:client, account: account) }
    let(:account)           { double(:account, messages: messages) }
    let(:messages)          { double(:messages) }
    
    let(:client_details) do
        {
            account_sid: "1",
            auth_token: "2",
            from: "+123456789",
            to: "+987654321",
            body: "Thanks for your order! Expect delivery before %s"
        }
    end
    
    let(:message_details) do
        {
            from:   client_details[:from],
            to:     client_details[:to],
            body:   client_details[:body] % "time"
        }
    end
    
    it 'sends a text with a delivery time' do
        allow(Time).to receive(:now).and_return("time")
        expect(messages).to receive(:create).with(message_details)
        text_message.send
    end
end