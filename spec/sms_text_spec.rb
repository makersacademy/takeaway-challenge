require'sms_text'

describe SMSText do
  include SMSText

  let(:send_sms) { double :send_sms }
  let(:delivery_time) { double :delivery_time}


end