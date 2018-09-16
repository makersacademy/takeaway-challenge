require 'delivery_sms'

describe DeliverySMS do
  context "#send" do
    it "sends a text to my phone" do
      subject.send
    end
  end
end
