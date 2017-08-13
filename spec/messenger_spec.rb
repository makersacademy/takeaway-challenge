require_relative '../lib/messenger.rb'

RSpec.describe Messenger do
  it { is_expected.to be_a Messenger }
  it { is_expected.to respond_to :send_sms }
end
