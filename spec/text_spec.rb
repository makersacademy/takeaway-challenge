require 'text'

describe Text do

  let(:messages) {spy(:messages)} # allows us to check if messages will be recieved?
  let(:client)  {double(:client, messages: messages)}

  let(:details) do {
    account_sid: "XXXX",
    auth_token: "4567",
    from: "075",
    to: "079",
    body: 'Your order will be with you at %s'
  } end

  subject(:text){described_class.new(details, client: client)}

  describe '#send_message' do
    it 'sends the message to the client' do
      arguement = {
        from: details[:from],
        to: details[:to],
        body: 'Your order will be with you at 18.52'
      }

      # find a way to check if @client is receiving the methods messages
      # and create with arguement.

      allow(text).to receive(:time).and_return("17:52")
      text.send_message # isn't recognising messages? 
      expect(messages).to have_received(:create).with(arguement)
    end
  end
end
