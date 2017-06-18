require './lib/message.rb'

describe Message do

  it 'responds to send_message' do
    expect(subject).to respond_to(:send_message)
  end

  it 'has a number to send from' do
    expect(subject.from).not_to eq nil
  end

  it 'has a number to send to' do
    expect(subject.to).not_to eq nil
  end
end
