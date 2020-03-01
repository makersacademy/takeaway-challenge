require 'message'

describe Message do
  it "can get the client's #phone_number" do
    # subject.stub(:phone_number) {"11111111111"}
    allow(subject).to receive(:phone_number).and_return("11111111111")
    expect(subject.phone_number).to eq("11111111111")
  end

  # it "can create a personalized message" do
  #   allow(subject).to receive(:create_message).and_return("Thanks for your order at Jara's Takeway. Your food will be with you before 12:00")
  #   expect(subject.message).to eq("Thanks for your order at Jara's Takeway. Your food will be with you before 12:00")
  # end
  #
  # it "can send a SMS via Twilio app" do
  #   # ?????
  # end
  #
  # it "returns a #delivery_time that adds one hour to Time" do
  #   allow(subject).to receive(Time.now.to_s).and_return("11:00")
  #   expect(subject.delivery_time).to eq("12:00")
  #
  #   expect{subject.delivery_time}.to be_within(2.hours).of(Time.now)
  # end
end
