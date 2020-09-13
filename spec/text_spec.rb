require 'text.rb'
require 'twilio-ruby'
require 'secret_number'

describe Text do

  it 'initialises with @from == a number from SecretNumber' do
    expect(subject.from).to eq(SecretNumber::TWIL_NUM)
  end

  it 'initialises with @to == a number from Secretnumber' do
    expect(subject.to).to eq(SecretNumber::NUMBER)
  end

  it 'confirms that the order has been agreed' do
    text = double("Text")
    allow(text).to receive(:confirm_order).and_return("Order confirmed!")
    expect(text.confirm_order).to eq "Order confirmed!"
  end

end
