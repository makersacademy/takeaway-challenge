require 'text'

describe Text do

let(:twilio_ruby) {double :twilio_ruby, new: twilio}
  subject(:text) {described_class.new}

  let(:twilio) {double :twilio, :messages => messages}
  let(:messages) {double :messages, :create => "Thank you! Your delivery should arrive by 21:10"}

  before (:each) do
  allow(Time).to receive(:now) {Time.new(2016,8,28, 20,10,0)}
  end

  it "send a text using twilio" do
    text.send_message
    expect(messages).to have_received(:create)
  end

  it 'send a text with eta' do
    expect{subject.send_message}.to output("Thank you! Your delivery should arrive by 21:10").to_stdout_from_any_process
  end
end
