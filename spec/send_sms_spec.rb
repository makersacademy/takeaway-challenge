require 'send_sms'

describe Message do
  it 'should instantiate a new instance' do
    expect(Message.new).to be_instance_of Message
  end
end