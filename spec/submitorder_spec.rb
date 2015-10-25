require 'submitorder'

describe SubmitOrder do
  account_sid = 'ACaa9d88865685ca7e9bdec766b71fa313'
  auth_token = '7fcdf88aeafb171703682f9e91c42d97'
  let(:client) {double(:client)}
  let(:sendthing) {double(:sendthing)}
  subject {SubmitOrder.new sendthing, account_sid, auth_token}
  let(:order) {double(:order)}

  before(:each) do
    allow(sendthing).to receive(:new).with(account_sid,auth_token).and_return(client)
  end

  context 'submitting an order' do
    it '#get order' do
      subject.order = order
      expect(subject.order).to eq order
    end
  end




end