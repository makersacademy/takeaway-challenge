require 'delivery_sms'

describe DeliverySMS do
  context "#send" do
    it "sends a text to my phone" do
      subject.send_confirmation
    end
  end

  context "#send_by_sms" do
    it "send a string in a text" do
      subject.send_by_sms("Food price etc.")
    end
  end
end
