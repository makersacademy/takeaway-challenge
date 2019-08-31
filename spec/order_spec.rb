require './lib/order'
require 'timecop'

describe Order do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30\nTotal: 8.60\nDelivers by: 11:10", 'to_string')

  let(:time) { Time.new(2000, 10, 10, 10, 10, 10) }

  before :each do
    Timecop.freeze(time)
  end

  after :each do
    Timecop.return
  end

  it 'has expected order total' do
    expect(subject.total).to eq '8.60'
  end

  it 'stamps the time it was created' do
    expect(subject.time).to eq time
  end

  it 'returns a copy of time' do
    expect(subject.time).not_to be time
  end

  it 'has a default delivery time of 1 hour after creation' do
    expect(subject.delivery_time).to eq Time.new(2000, 10, 10, 11, 10, 10)
  end

  it 'has a configurable delivery window' do
    order = Order.new([], 2 * (60 * 60))
    expect(order.delivery_time).to eq Time.new(2000, 10, 10, 12, 10, 10)
  end
end