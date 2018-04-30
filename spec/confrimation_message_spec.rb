require './lib/confirmation_message.rb'

class MessagingHolder; include ConfirmationMessage end

describe ConfirmationMessage do
  it 'will confirm the time the order will be delivered' do
    messaging_holder = MessagingHolder.new
    time = Time.new
    expect(messaging_holder.delivery_time).to eq((time.hour + 1).to_s + ":" + time.min.to_s)
  end
end
