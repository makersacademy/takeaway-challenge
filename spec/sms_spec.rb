require 'SMS'
describe SMS do
  xit "requests a user's phone number" do
  end

  xit 'sends a confirmation sms to that phone number' do
  end

  xit 'informs the recipient that their meal is on their way and lets them know it will arrive in an hour' do
  end

  it 'changes the status of sent? to true when a message is sent' do
    expect {subject.send_sms}.to change(subject, :sent?).to true
  end

  it 'confirms a message has been sent' do
    expect(subject.sms_sent_confirmation).to eq('A confirmation message has been sent to the number you provided')
  end
end
