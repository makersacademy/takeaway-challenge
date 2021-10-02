require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'loads a menu' do

  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text)
    takeaway.complete_order
  end

end