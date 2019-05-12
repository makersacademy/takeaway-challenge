require 'message_service'

describe MessageService do
  let(:config) {
    double :config,
      :account_sid => "secret account sid",
      :auth_token => "secret auth token",
      :from => "sender phone number",
      :to => "recipient phone number"
  }
  let(:subject) { MessageService.new(config) }

  it 'can send a message' do
    expect(subject).to respond_to(:send_message).with(1).argument
  end

  it 'sends the correct messsage' do
    messages_double = double(:messages)
    allow(messages_double).to receive(:create)
    twilio_client_double = double(:twilio_client, :messages => messages_double)
    allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client_double)

    subject.send_message("Hello")

    expect(messages_double).to have_received(:create).with({
      :from => config.from,
      :to => config.to,
      :body => "Hello" })
  end
end
