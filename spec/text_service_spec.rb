require 'text_service'

describe TextService do

  time = Time.now + (1 * 60 * 60)
  time = time.strftime('%-H:%M')
  msg = "Thank you! Your order was placed and will be delivered before #{time}"

  it 'sends a message' do
    subject.send_sms(msg)
  end

end
