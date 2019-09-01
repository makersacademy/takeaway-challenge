require './lib/order'
require 'timecop'

describe Order do
  include_examples 'Test Helpers'

  let(:formatter)   { instance_double('TimeFormatter') }
  subject           { described_class.new([menu_item, menu_item], 60 * 60, formatter) }

  before :each do
    allow(formatter).to receive(:format).and_return('11:10')
    Timecop.freeze(time)
  end

  after :each do
    Timecop.return
  end

  it 'has the expected order total' do
    expect(subject.total).to eq '8.60'
  end

  it 'stamps the time it was created' do
    expect(subject.time).to eq time
  end

  it 'returns a copy of the time it was created' do
    expect(subject.time).not_to be time
  end

  it 'asks formatter to format delivery time when outputting string' do
    subject.to_string
    expect(formatter).to have_received(:format).with(subject.delivery_time)
  end

  it 'has a configurable delivery window' do
    order = described_class.new([], 2 * (60 * 60), formatter)
    expect(order.delivery_time).to eq time + 2 * (60 * 60)
  end

  it 'can output to a string' do
    expect(subject.to_string).to eq "Cafe Latte - 4.30\nCafe Latte - 4.30\nTotal: 8.60\nDelivers by: 11:10"
  end
end