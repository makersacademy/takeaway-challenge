require 'sms_client'
describe 'SMSClient' do
  #unsure how to test?
  let(:account_sid) {double}
  let(:auth_token) {double}
  subject{SMSClient.new}
  it { is_expected.to respond_to(:set_credentials).with(3).argument }
  it { is_expected.to respond_to(:set_to_number).with(1).argument }

end