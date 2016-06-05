describe SmsInterface do 

  let(:twilio_sms) { spy :twilio_sms, create: nil }
  subject(:sms_interface) { described_class.new(twilio_sms)}

  it ':send_text sends #create to the API' do
    sms_interface.send_text('+447733362000', 'Mock my mac')
    expect(twilio_sms).to have_received(:create)
  end 

end 
