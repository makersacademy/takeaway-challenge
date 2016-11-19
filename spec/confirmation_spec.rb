require "./lib/confirmation"

describe Confirmation do
  subject(:confirmation) {described_class.new}

  before do
    allow(confirmation).to receive(:send_message)
  end

  it "should send a text message that says the delivery time" do
    expect(confirmation).to receive(:send_message) {"Thank you! Your order was placed and will be delivered before 8:00pm"}
    confirmation.time
  end

end
