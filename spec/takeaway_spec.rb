require 'takeaway'
require 'timecop'

describe Takeaway do
  before do
    Timecop.freeze(Time.local(2022, 3, 4, 15, 23, 0))
  end

  after do
    Timecop.return
  end

  let(:twilio) { spy(:twilio_double) }
  subject(:takeaway) { Takeaway.new(twilio) }

  it 'sends a confirmation text to TwilioManager' do
    takeaway.send_confirmation_text
    expect(twilio).to have_received(:send_sms).with('Thank you! Your order was placed and will be delivered before 16:23')
  end
end
