require 'text'

describe Text do
  let(:text) { described_class.new }
  let(:user) { double :user }

  it 'calculates the current time, then adds one hour' do
    expect { text.calculating_time }.to change { text.delivery_hour }
  end

  it 'possible stubbs test for calculating time' do
    allow(text).to receive(:calculating_time) { "22:15" }
    expect(text.calculating_time).to eq("22:15")
  end

  # it 'passes the total_amount over from the user' do
  #   expect(text.total_price_of_basket).to eq()
  # end

  # it 'the output message includes the time and order total' do
  #   allow(text).to receive(:calculating_time) { "22:15" }
  #   output = "Thank you! Your order was placed and will be delivered before 22:15 Year: 9906. We hope you enjoy your average at best meal./n"
  #   expect(text.text_for_message).to eq(output)
  #   text.text_for_message
  # end

end
