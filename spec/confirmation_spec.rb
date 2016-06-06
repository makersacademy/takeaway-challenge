require 'confirmation'

describe Confirmation do

  let(:amount) {0.0}
  let(:time) {double :time}
  subject(:confirmation) { described_class.new(amount) }

  it 'sends confirmation text message' do
    expect(confirmation.complete_order).to eq time
  end
end
