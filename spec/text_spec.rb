require 'text'

describe Text do

let(:twilio_class_double) {double :twilio_class_double, new: twilio}
subject(:text){described_class.new(twilio_class_double)}
let(:twilio){double :twilio, :messages => messages}
let(:messages) {double :messages, :create => nil}

  it 'sends a text to the user using Twilio' do
    text.send_text
    expect(messages).to have_received(:create)
  end

end
