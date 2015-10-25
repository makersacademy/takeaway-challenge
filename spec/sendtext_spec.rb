require 'sendtext'

describe Sendtext do
  account_sid = 'ACaa9d88865685ca7e9bdec766b71fa313'
  auth_token = '7fcdf88aeafb171703682f9e91c42d97'


  from_mobile = '+441384901121'
  to_mobile = '+447914245451' #+447508059316 other verified number
  message_body = 'This is a Twillo Test for takeaway challenge'

  message =   {from: from_mobile,
              to: to_mobile,
              body: message_body}
  let(:twillo) {double(:twillo)}
  let(:client) {double(:client)}
  let(:create) {double(:create)}

  subject {Sendtext.new twillo, account_sid, auth_token} #Twilio::REST::Client

  context 'when sending message' do
    it '#send_message' do
      allow(twillo).to receive(:new).with(account_sid,auth_token).and_return(client)
      allow(client).to receive(:messages).and_return(client)
      allow(client).to receive(:create).with(message).and_return(client)
      subject.send_message = message
      expect(subject.message).to eq message
    end
  end


end