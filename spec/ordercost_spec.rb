require 'ordercost'

describe OrderCost do
  subject(:ordercost) {described_class.new}
  it 'starts with a total cost of 0' do
    expect(ordercost.total).to eq 0
  end

  it 'can increase the total' do
    expect{ordercost.add(1)}.to change{ordercost.total}.by(1)
  end

  it 'can reset total' do
    ordercost.add(1)
    ordercost.reset
    expect(ordercost.total).to eq 0
  end
end