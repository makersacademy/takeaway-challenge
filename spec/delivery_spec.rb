require 'delivery'
require 'stringio'
require 'timecop'

describe Delivery do
  subject { Delivery.new(text_message) }

  let(:text_message) { double(:text_message, new: nil) }

  before do
    Timecop.freeze(Time.parse("16:45"))
    STDIN = StringIO.new("+44123456789")
  end

  it 'tells the user when the order has been placed' do
    message = "Order placed! It will be delivered by 17:45\nEnter mobile number\n"
    expect { subject }.to output(message).to_stdout
  end

end
