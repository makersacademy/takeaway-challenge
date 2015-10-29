require 'sms'

describe Sms do

  let(:client){ double(:client) }
  let(:client_klass){ double(:client_klass, new: client) }

  subject(:sms){ Sms.new(client_klass) }

  context '#initialize' do
    it 'sets @client to a new client object' do
      expect(sms.client).to eq client
    end
  end
  context '#send' do
    it 'calls #account.messages.create on @client' do
      expect(client).to receive_message_chain(:account, :messages, :create)
      sms.send('msg')
    end
  end


end
