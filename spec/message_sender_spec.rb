require 'message_sender'
describe MessageSender do
  it 'sends an sms message when instructed to do so with a phone number and time' do
    messages_double = double :messages, create: nil
    client_double = double :client, messages: messages_double
    twilio_class_double = double :twilio_class, new: client_double
    message_sender = MessageSender.new(twilio_class_double)
    message_sender.send_message("+447777777777", "2019-02-17 15:52:35 +0000")
    expect(messages_double).to have_received(:create).with(from: "+441249400064", to: "+447777777777", body: "Thank you for the order. It will be delivered by 2019-02-17 15:52:35 +0000")
  end

end
