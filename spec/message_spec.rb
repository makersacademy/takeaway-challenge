require 'message'

describe Message do
  it 'Sends a sms confirmation message with 2 arguments(number,name)' do
    expect(Message.new.send("+555","Jim"))
      .to eq("Sent message to Jim")
  end
end
