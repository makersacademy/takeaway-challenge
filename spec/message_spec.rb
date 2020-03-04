require 'message'

describe Message do

  it "can get the client's #phone_number" do
    allow(subject).to receive(:input_number).and_return("11111111111")
    subject.ask_for_number
    expect(subject.phone_number).to eq("11111111111")
  end

  it "can #input_number from user" do
    allow(subject).to receive(:gets).and_return("input")
    expect(subject.input_number).to eq("input")
  end

  it "can calculate #delivery_time" do
    # How to mock Time?
    allow(Time.now).to receive(:strftime).and_return("12:00")
    expect(subject.delivery_time).to eq("13:00")
  end

  it "can #create_message" do
    allow(subject).to receive(:delivery_time).and_return("12:00")
    expect(subject.create_message).to eq ("Thanks for your order at Jara's Takeway.
    Your food will be with you before 12:00")
  end

  it "can #send_message" do
    expect(subject).to receive(:ask_for_number).once
    expect(subject).to receive(:create_message).once
    expect(subject).to receive(:twilio_sms).once
    subject.send_message
  end
end
