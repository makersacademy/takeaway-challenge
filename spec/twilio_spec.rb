require 'twilio'

describe Twilio do
  class DeliveryClass
  end

before(:each) do
   @delivery_class = DeliveryClass.new
   @delivery_class.extend(Twilio)
end

 it "responds to account.messages.create" do
   expect(@delivery_class.client).to respond_to(:account)
 end
end
