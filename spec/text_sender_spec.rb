require 'text_sender'
require 'time'

describe TextSender do

  let(:text_sender)   { TextSender.new(time_class, client_class) }
  let(:time_class)    { double(:time_class, new: time) }
  let(:time)          { double(:time, hour: 16, min: 50) }
  let(:client_class)  { double(:time_class, new: client) }
  let(:client)        { double(:client, messages: messages, create: 0) }
  let(:messages)      { double(:messages, create: 0) }

  it 'can generate a message body' do
    expect(text_sender.generate_message_body).to eq("Thank you! Your order was placed and will be delivered before 17:50")
  end

  it 'can send a text message' do
    expect(text_sender.send_message).to eq(0)
  end
  
end
