require 'texter'

describe Texter do
  let(:client) {double(:client, account: account)}
  let(:account) {double(:accnt, messages: messages)}
  let(:messages) {double(:messages)}
  let(:number) {'07854015421'}
  before do
    subject.instance_variable_set("@client", client)
    allow(messages).to receive(:create)
  end

  it 'does the business' do
    expect(client).to receive(:account)
    expect(account).to receive(:messages)
    expect(messages).to receive(:create)
    subject.text(number)
    end
end
