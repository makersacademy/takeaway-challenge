require 'despatch'

describe Despatch do

let(:twilio_class_double) {double :twilio_class_double, new: twilio}
subject(:despatch) {described_class.new(twilio_class_double)}
let(:twilio) {double :twilio, :messages => messages}
let(:messages) {double :messages, :create => nil}

before (:each) do
  allow(Time).to receive(:now) {Time.new(2016,8,27, 19,13,0)}
end

  it 'genertes ETA at time + 1' do
    expect(subject.estimate_eta).to eq("20:13")
  end

  it 'sends texts using Twilio API' do
    subject.send_text
    expect(messages).to have_received(:create)
  end

end
