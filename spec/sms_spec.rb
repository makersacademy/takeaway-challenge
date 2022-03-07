require 'sms'

describe SMS do
  it "sends text messages to the client" do
    message = double("Message", :create => "success")
    sms = SMS.new(double("Mock_client", :messages => message))
    # mock client receives .messages and forwards it to .create

    test_str = "This was passed from the .text parameter into the client"
    test_text = {
      :body => test_str,
      :from => ENV['TWILIO_PHONE_NUMBER'],
      :to => ENV['CELL_PHONE_NUMBER']
    }

    expect(sms.client.messages).to receive(:create).with(test_text).and_return("success")
    sms.text(test_str)
  end
end
