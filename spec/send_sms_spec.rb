require 'sendSms'

describe SendSms do

  let(:phonenumber) { double :phonenumber }

  it "repsonds to send_confirmation_sms" do
    expect(subject).to respond_to(:send_confirmation_sms)
  end

  # Unsure if necessary (or possible) given Twilio's own tests/error raising.
  # it "send_confirmation_sms creates sms using client" do
  #   expect(subject.send_confirmation_sms(phonenumber)).to be_a Twilio::REST::Message
  # end

end