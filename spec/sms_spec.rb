require 'sms'

describe SMS do
  it "sends text messages to the client" do
    message = double("Message", :create => "success")
    sms = SMS.new(double("Mock_client", :messages => message))

    test_str = "This was passed from the .text paramter into the client"
    test_text = {
      :body => test_str,
      :from => ENV['TWILIO_PHONE_NUMBER'],
      :to => ENV['CELL_PHONE_NUMBER']
    }

    expect(sms.client.messages).to receive(:create).with(test_text).and_return("success")
    sms.text(test_str)
  end

  # I'm not sure if this is a good test, all it shows it that any client will get passed
  # the :to :from and :body from the .text method
end