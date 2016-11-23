require 'sms.rb'

describe Sms do

  subject(:sms) {described_class.new}

  before do
    allow(sms).to receive(:send_message)
  end

  context '.send_sms' do

    it 'should send a text with the twillio api' do
      message = 'Thanks for your order of 4 items.
      The special x 1,Chicago classic x 2, Meat & more meat x 1
      The charge is £#{order.bill_total} and will be delivered before #{@order.order_due_time}'
      expect(sms).to receive(:send_message).with(message)
      subject.send_message(message)
    end

  end

end
