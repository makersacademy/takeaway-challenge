require 'sms'

describe Sms do

  subject(:sms){described_class.new(client: client, number: number, request_class: request_class)}

  let(:number){'twilio-number'}
  let(:mobile){'mobile'}
  let(:body){'body'}
  let(:channel){'SMS'}
  let(:customer){double :Customer, name:'customer', mobile: mobile}
  let(:time){Time.now + (60 * 60)}
  let(:message_params){{:from => number, :to=> mobile, :body=>"#{Sms::CONFIRMATION_MESSAGE} #{time}"}}

  let(:client){double :Client, account: account}
  let(:account){double :account, messages: messages}
  let(:messages){double :messages, create: nil, list:nil}


  let(:valid_body){'ORDER curry 1,chips 2,salad 3, chili 4'}
  let(:invalid_body){'Lorem ipsum'}

  let(:invalid_message){double :message, body: invalid_body, from: mobile, date_sent: time}
  let(:sent_message){double :message, body: body, from: number, date_sent: time}
  let(:valid_message){double :message, body: valid_body, from: mobile, date_sent: time}

  let(:request_class){double :Request, new:request}
  let(:request){double :request, channel: channel, from: mobile, body:body, datetime:time}

  it{is_expected.to respond_to(:send_message)}

  describe '#send_message' do
    it 'sends a message' do
      expect(messages).to receive(:create).with(message_params)
      sms.send_message(customer:customer, delivery_time:time)
    end
  end

  describe '#get_messages' do
    it 'receives an array containing a single valid message' do
      allow(messages).to receive(:list).and_return([valid_message])
      expect(sms.get_messages).to eq [request]
    end
    it 'receives an array containing multiple messages' do
      allow(messages).to receive(:list).and_return([valid_message,valid_message])
      expect(sms.get_messages).to eq [request, request]
    end
    it 'filters out sent messages' do
      allow(messages).to receive(:list).and_return([valid_message,sent_message])
      expect(sms.get_messages).to eq [request]
    end
    it "filters out received messages that don't start with #{Sms::ORDER_KEYWORD}" do
      allow(messages).to receive(:list).and_return([valid_message,invalid_message])
      expect(sms.get_messages).to eq [request]
    end
  end
end
