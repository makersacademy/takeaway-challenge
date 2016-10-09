require 'messager'

describe Messager do
  it 'responds to the send_message method' do
    expect(subject).to respond_to(:send_message).with(1).argument
  end
end