require_relative '../lib/sms_confirmation.rb'

describe SmsConfirmation do
  it 'successfully sends text without raising error' do
    expect { subject.send_message }.to_not raise_error
  end
end
