require 'takeaway.rb'

describe Takeaway do

  let(:customer) { double:customer, mobile: 123 }

  it 'responds to create_bill method with an argument' do
    is_expected.to respond_to(:create_bill).with(1).argument
  end

  it 'should add up the total bill correctly' do
    t = Takeaway.new
    allow(customer).to receive(:order) { [5.00, 3.50] }
    expect(t.create_bill customer).to eq("Your total bill is £8.50")
  end

  it 'should respond to confirm_order' do
    is_expected.to respond_to(:confirm_order).with(1).argument
  end

  it 'connects with Twilio' do
    client = double(:client)
    allow(client).to receive_message_chain(:messages, :create)
    expect(Twilio::REST::Client).to receive(:new).and_return(client)
    subject.send_text(customer)
  end
end
