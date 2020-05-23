require 'delivery'
require 'timecop'

describe Delivery do
  subject { Delivery.new }

  it 'calculates delivery time' do
    expect(subject.calculate_delivery).to eq(Time.now + 60 * 60)
  end

end
