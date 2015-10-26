require 'submitorder'

describe SubmitOrder do
  account_sid = 'private'
  auth_token = 'secret'
  let(:client) {double(:client)}
  let(:sendthing) {double(:sendthing)}
  subject {SubmitOrder.new sendthing, account_sid, auth_token}
  let(:order) {double(:order)}
  let(:total1) {10}

  from_mobile = '+44999999999'
  to_mobile = '+449999999999'
  message_body = 'This is a Twillo Test for takeaway challenge'

  message = {from: from_mobile,
                to: to_mobile,
                body: message_body}


  before(:each) do
    allow(sendthing).to receive(:new).with(account_sid,auth_token).and_return(client)
    allow(client).to receive(:send_message=).with(message).and_return("Message sent")
    allow(order).to receive(:total).and_return(total1)
    subject.get(order,total1)
  end

  context 'submitting an order' do
    it '#order' do
      expect(subject.order).to eq order
    end
    it '#get' do
      expect(subject.total).to eq total1
    end
    it '#validated' do
      expect(subject).to be_validated
    end
    it '#submit validated' do
      expect(subject.submit message).to eq "Order OK and sent expect a text message confirmation"
    end
    it '#submit not validated' do
      allow(order).to receive(:total).and_return(total1+1)
      expect(subject.submit message ).to eq "Order total incorrect"
    end
  end




end