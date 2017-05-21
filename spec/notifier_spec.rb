require 'notifier'

describe Notifier do

  let(:message) { double :message, :sid => 'ID' }
  let(:messages) { double :messages, :create => message }
  let(:account) { double :account, :messages => messages }
  let(:client) { double :client, :account => account }
  let(:client_class) { double :client, :new => client }
  let(:subject) { Notifier.new(client_class)}

  it 'sends a message' do
    message = 'Thank you for your order.'
    expect(client.account.messages).to receive(:create).with(hash_including(:body => message))
    subject.send(message)
  end

end
