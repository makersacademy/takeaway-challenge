require 'delivery_sms'

xdescribe DeliverySMS do
  context "#send" do
    it "sends a text to my phone" do
      subject.send
    end
  end
end
