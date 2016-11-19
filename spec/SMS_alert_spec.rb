require 'sms_alert'

describe SMS do
  subject(:sms){ described_class }

  it{ is_expected.to respond_to(:send_message) }

  it{ is_expected.to respond_to(:delivery_time) }
end
