require 'text'

describe Text do

  subject(:text) {described_class.new}
  let(:twilio_class_double) {double :twilio_class_double, new: twilio}
  let(:twilio) {double :twilio, :messages => messages}
  let(:messages) {double :messages, :create => nil}

  before (:each) do
  allow(Time).to receive(:now) {Time.new(2016,8,28, 20,10,0)}
  end

  it "send a text confirm the delivery eta" do
    text.send_message
    expect(messages).to have_received(:create)
  end
end
