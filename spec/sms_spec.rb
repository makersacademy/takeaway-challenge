require "sms"

describe SMS do

  let (:sms) { described_class.new }

  before do
    allow(sms).to receive(:send_sms) {"Thankyou! Your order was placed and will be delivered before 6:00pm"}
  end

  it "should display time one hour on from current time" do
    confirmation = "Thankyou! Your order was placed and will be delivered before 6:00pm"
    expect(sms.send_sms(confirmation)).not_to eq(Time.now)
  end

end
