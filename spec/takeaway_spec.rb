require 'takeaway'
require 'dotenv/load'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text).with(20.93)
    takeaway.complete_order(20.93)
  end
end
