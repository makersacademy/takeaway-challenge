require 'sms'
require 'yaml'

describe SMS do 
  subject(:sms) { described_class.new(config, client: client)}

  let(:client) { double :client, account: account, messages: messages}
  let(:messages) { double :messages }
  let(:account) { double :account, messages: messages}

  let(:config) do
    YAML.load_file('config.yml')
  end

  it 'sends a confirmation for the order and estimated time' do
    args = {
      from: config['from'],
      to: config['to'],
      body: "Thank you! Your order was placed and will be delivered before 15:21"
    }

    allow(Time).to receive(:now).and_return(Time.parse("14:21"))
    expect(client.account.messages).to receive(:create).with(args)
    sms.deliver
  end
end