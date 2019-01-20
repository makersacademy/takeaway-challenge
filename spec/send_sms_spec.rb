require 'send_sms'
require 'fake_sms'
require 'order_processor'

describe SMSMessage do

  before(:each) do
    @fake_sms = FakeSMS.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_ACCOUNT_AUTH_TOKEN"])
    @fake_sms.instance_variable_set(:@message_list, [])
    @from = ENV["FROM_NUMBER"]
    @to = ENV["TO_NUMBER"]
    @last_message = "Thank you! Your order was placed with a total order of 1 and price of £3 " +
    "will be delivered before #{Time.now + 1*60*60}"
    @dish = Dishes.new("Fish", 3)
    @list_of_dishes = ListOfDishes.new.add_dish(@dish)
    @order_processor = OrderProcessor.new(@list_of_dishes)
  end

  it "should return message and store it in message array" do
    subject.instance_variable_set(:@client, @fake_sms)
    #allow(@fake_sms.messages).to receive(:create).with(from: @from, to: @to, body: @last_message)
    subject.send_sms_message(1, 3)
    expect(@fake_sms.message_list.last).to eql(@last_message)
  end

 end
