require 'sms'

describe Sms do

  subject(:sms){described_class.new(client: client, number: number)}

  let(:number){'dummy'}
  let(:mobile){'mobile'}
  let(:customer){double :Customer, name:'customer', mobile: mobile}
  let(:time){Time.now + (60 * 60)}
  let(:message_params){{:from => number, :to=> mobile, :body=>"#{Sms::CONFIRMATION_MESSAGE} #{time}"}}

  let(:client){double :Client, account: account}
  let(:account){double :account, messages: messages}
  let(:messages){double :message, create: nil}

  it{is_expected.to respond_to(:send_message)}

  describe '#send_message' do
    it 'sends a message' do
      expect(messages).to receive(:create).with(message_params)
      sms.send_message(customer:customer, delivery_time:time)
    end
  end

end
