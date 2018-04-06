require 'messenger'
require 'envyable'
Envyable.load('config/env.yml')


describe Messenger do
  subject(:messenger) { described_class.new }

  it 'Checking for the Twilio ACCOUNT_SID' do
    expect(messenger.account_sid).to eq ENV["ACCOUNT_SID"]
  end

  it 'Checking for the Twilio AUTH_TOKEN' do
    expect(messenger.auth_token).to eq ENV["AUTH_TOKEN"]
  end
end
