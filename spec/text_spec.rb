require 'text'
#
describe Text do
  let(:messages) {spy(:messages)}
  let(:account_sid) {"AC436e6f2512545447559a7e2acec8acf5"}
  let(:auth_token) {"b122cff226597aba1477cbc7e1c0ab1a"}

  it 'delivers a message' do
    client_double = double :client
    client_class_double = double :Client, new: client_double, messages: messages
    message_arg =
       {
         from: "+441547220145",
         to: "+447903616384",
         body: "Thank you! Your order was placed and will be delivered before 18:52."
       }
       text = Text.new(client_class_double)
       allow(client_double).to receive(:messages).and_return(messages)
       text.deliver
       expect(messages). to have_received(:create)
       expect(text.deliver).to eq messages

  end

  it 'creates a message' do
    client_double = double :client
    client_class_double = double :Client, new: client_double, messages: messages
    message_arg =
       {
         from: "+441547220145",
         to: "+447903616384",
         body: "Thank you! Your order was placed and will be delivered before 18:52."
       }
       text = Text.new(client_class_double)
       allow(client_double).to receive(:messages).and_return(messages)
       text.deliver
       expect(messages). to have_received(:create)
       expect(text.create).to eq message_arg
  end

end
