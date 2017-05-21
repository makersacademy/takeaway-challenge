require 'confirmation'
describe Confirmation do
  subject(:confirmation) { described_class.new }

  before do
    allow(confirmation).to receive(:send_sms) { "Thank you! Your order was placed and will be delivered before #{Time.now}." }
  end

  it 'sends a confirmation text message with the expected delivery time' do
    expect(confirmation.time).to eq((Time.now + 3600).strftime("%H:%M:%S"))
  end
end
