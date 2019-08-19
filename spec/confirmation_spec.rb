require 'confirmation'

describe Confirmation do
  let(:t) { Time.new }
  let(:time) { double(:time, now: Time.new(t.year, t.month, t.day, 10, 0, 0)) }
  subject(:subject) { described_class.new(time) }
  it 'returns a message with delivery time in one hour' do
    expect(subject.message).to eq("Thank you! Your order was placed and will be delivered before 11:00")
  end
end
