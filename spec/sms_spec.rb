require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  it { is_expected.to respond_to(:send_text) }


  # let client double client, messages = . messages
  # let messages double messages
  #
  # expect messages to receive create
  #sms.send_text

# test if message is received too


end
