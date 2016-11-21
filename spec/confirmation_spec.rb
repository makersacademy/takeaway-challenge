require "./lib/confirmation"

describe Confirmation do
  subject(:confirmation) { described_class.new }

  before do
    allow(confirmation).to receive(:send_message) {"Thank you! Your order was placed and will be delivered before 8:00pm"}
  end

  it "should display time in hour, minutes, am/pm, one hour from current time" do
    expect(confirmation.time).not_to eq(Time.now)
  end

  it "should send a text message that says the delivery time (an hour from now)" do
    confirmation.time
  end

end
