require 'sms_client'
describe 'SMSClient' do
  #unsure how to test?
  let(:account_sid) {double}
  let(:auth_token) {double}
  subject{SMSClient.new(:account_sid ,:auth_token)}
  it { is_expected.to respond_to(:set_from_number).with(1).argument }
  it { is_expected.to respond_to(:set_to_number).with(1).argument }

end