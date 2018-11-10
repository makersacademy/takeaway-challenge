require 'messenger'

describe Messenger do
  let(:messages) { double(:messages, create: true) }
  let(:client) { double(:client, messages: messages) }
  let(:credentials) do {sid: 'ACxxxxxxxxxxxxxxx',
                       auth_token: 'yyyyyyyyyyyyyyyyyy',
                       to: '2340984',
                       from: '21390349' }
  end

  let(:auth_token) { 'yyyyyyyyyyyyyyyyyy' }
  let(:order) { double(:order, total: 999) }
  subject(:messenger) { Messenger.new(client, order, credentials) }

  it 'it can call a client to send a message' do
    expect(messenger.send).to eq(true)
  end

  it 'can prepare a message hash to give to client' do
    expect(messenger.message).to eq( {from: credentials[:from], to: credentials[:to],
                                      body: "Hi there, your order totalling £9.99 " +
                                            "will be with you at " +
                                            "#{Time.new.hour + 1}:#{Time.new.min}"} )
  end
end
