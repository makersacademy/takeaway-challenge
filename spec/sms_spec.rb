require 'sms'
describe Sms do

  it "#send_confirmation_sms" do
    expect(sms.send_confirmation_sms).to eq "Thank you for ordering, your order will be delivered by #{delivery_time}"

  end

end
