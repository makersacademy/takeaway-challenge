require 'send-sms'

describe SMS do

  describe ".send_sms" do

    it "will send a SMS to the cusomter's phone number" do

      # set-up
      calc_time_double = double("represents DeliveryTimeClass", :add_one_hour => "time")
      client = double("represents a client")
      client_messages = double("reperesents messages")
      info = { "body" => "data" }

      allow(client).to receive(:messages).and_return(client_messages)
      allow(client_messages).to receive(:create).with(info).and_return("SMS Sent")
      allow(calc_time_double).to receive(:add_one_hour)

      sms = SMS.new(calc_time_double, client)
      allow(sms).to receive(:send_sms).and_return("SMS Sent")
      # execute and expectation
      expect(sms.send_sms).to eq "SMS Sent"
    end

  end

  describe ".delivery_time" do

    it "will add one hour from now" do
      calc_double = double("represents DeliveryTime Class")
      now = Time.new
      hour = now.strftime("%H").to_i
      minute = now.strftime("%M")

      allow(calc_double).to receive(:add_one_hour)

      expect(subject.delivery_time).to eq "#{hour + 1}:#{minute}"
    end

  end

end
