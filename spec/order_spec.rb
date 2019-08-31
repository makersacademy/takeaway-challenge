require './lib/order'
require 'timecop'

describe Order do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30\nTotal: 8.60\nDelivers by: 11:10", 'to_string')

  let(:time_placed) { Time.new(1750, 7, 28, 10, 10, 10) }
  let(:formatter)   { instance_double('TimeFormatter') }
  subject           { described_class.new([menu_item, menu_item], 60 * 60, formatter) }

  before :each do
    allow(formatter).to receive(:format).and_return('11:10')
    Timecop.freeze(time_placed)
  end

  after :each do
    Timecop.return
  end

  it 'has the expected order total' do
    expect(subject.total).to eq '8.60'
  end

  it 'stamps the time it was created' do
    expect(subject.time).to eq time_placed
  end

  it 'returns a copy of the time it was created' do
    expect(subject.time).not_to be time_placed
  end

  it 'asks formatter to format delivery time when outputting string' do
    subject.to_string
    expect(formatter).to have_received(:format).with(subject.delivery_time)
  end

  it 'has a configurable delivery window' do
    order = Order.new([], 2 * (60 * 60), formatter)
    expect(order.delivery_time).to eq time_placed + 2 * (60 * 60)
  end
end