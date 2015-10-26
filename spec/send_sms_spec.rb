require 'send_sms'

describe SendSMS do

  subject(:sendsms) { described_class.new(order, total) }
  let(:order) { double() }
  let(:total) { double() }

end
