require 'text_service'

describe TextService do

  time = Time.now + (1 * 60 * 60)
  time = time.strftime('%-H:%M')
  msg = "Thank you! Your order was placed and will be delivered before #{time}"

  it{ is_expected.to respond_to (:send_sms) }

end
