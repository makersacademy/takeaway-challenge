require 'customer'

describe Customer do

  let(:customer) { Customer.new("+44222333") }
  let(:twilio) {double :Twilio::REST::Client}

  it 'will not send out a message when send_message is false' do
    customer.send_sms_to_customer(false)
    expect(customer).not_to receive(:send_out_message)
  end

  #didn't know how to stub out the twilio @client line @client = Twilio::REST::Client.new account_sid, auth_token

  xit 'can send out a message when send_message is true' do
    customer.send_sms_to_customer(true)
    expect(customer.send_message).to be true
  end
end