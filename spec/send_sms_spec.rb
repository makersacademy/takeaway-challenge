require 'send_sms'

describe Send_sms do

  let(:phonenumber){double :phonenumber}

  #Unsure if necessary (or possible) given Twilio's own tests/error raising.
  xit "send_confirmation_sms creates sms using client" do
    expect(subject.send_confirmation_sms(phonenumber)).to be_a Twilio::REST::Message
  end

end