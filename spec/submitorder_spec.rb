require 'submitorder'

describe SubmitOrder do
  account_sid = 'ACaa9d88865685ca7e9bdec766b71fa313'
  auth_token = '7fcdf88aeafb171703682f9e91c42d97'
  let(:client) {double(:client)}
  let(:sendthing) {double(:sendthing)}
  subject {SubmitOrder.new sendthing, account_sid, auth_token}
  let(:order) {double(:order)}
  let(:total1) {10}
  let(:mobilenumber) {'+447914245451'}


  before(:each) do
    allow(sendthing).to receive(:new).with(account_sid,auth_token).and_return(client)
    allow(client).to receive(:send_message=).with("Thank you! Your order was placed and will be delivered before 18:52").and_return("Message sent")
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
      expect(subject.submit mobilenumber).to eq "Order OK and sent expect a text message confirmation"
    end
    it '#submit not validated' do
      allow(order).to receive(:total).and_return(total1+1)
      expect(subject.submit mobilenumber ).to eq "Order total incorrect"
    end
  end




end