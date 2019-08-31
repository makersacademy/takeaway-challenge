require './lib/takeaway'
require './lib/order'

describe Takeaway do
  subject          { Takeaway.new(sms_sender, { 'Cafe Latte' => '4.75', 'Cappuccino' => '3.85' }) }
  let(:sms_sender) { instance_double('SMSSender') }

  let(:cafe_latte) { MenuItem.new('Cafe Latte', '4.75') }
  let(:cappuccino) { MenuItem.new('Cappuccino', '3.85') }

  let(:order)      { Order.new([cafe_latte, cappuccino]) }

  it 'has a menu' do
    expect(subject.menu.items).to include cafe_latte, cappuccino
  end

  it 'can retrieve ordered items by index' do
    expect(subject.order([0, 1])).to eq order
  end

  it 'can send an sms confirmation' do
    allow(sms_sender).to receive(:send)
    subject.send_sms_confirmation(to: '+44123456789', body: 'Body')

    expect(sms_sender).to have_received(:send).with('+44123456789', 'Body')
  end
end