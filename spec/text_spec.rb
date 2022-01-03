require 'text'

describe Text do
  subject(:text) { described_class.new }
  let(:client) { double :client }
  
  it "can send text" do
    message = 'Order complete'
    twilio_message_body = { from: ENV['FROM'], to: ENV['TO'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).and_return(client)
    subject.send_text(message)
  end
end

=begin
# I tried to use the Webmock gem to stub out the Twilio gem (?) but failed miserably :(
  it 'can send text' do
    message = 'order complete'
    host = "#{ENV['ACCOUNT_SID']}: #{ENV['AUTH_TOKEN']}@api.twilio.com"
    assert_requested(:post, "#{host}/2010-04-01/Accounts/#{ENV['ACCOUNT_SID']}/Messages.json").
    with(:body => {:data => {'From' => ENV['FROM'], 'To' => ENV['TO'], 'Body' => message}})
    text.send_text(message)
  end
=end
