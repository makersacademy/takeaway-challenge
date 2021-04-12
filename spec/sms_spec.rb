require 'sms'

describe Messenger do
  it { is_expected.to respond_to :send_text }
end
