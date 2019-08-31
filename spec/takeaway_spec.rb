require './lib/takeaway'

describe Takeaway do
  def init_subject
    Takeaway.new(sms_class, menu_hash, menu_class)
  end

  subject          { init_subject }

  let(:sms_class)  { class_double('SMSSender', new: sms_sender) }
  let(:sms_sender) { instance_double('SMSSender') }

  let(:menu_class) { class_double('Menu', new: menu) }
  let(:menu)       { instance_double('Menu') }
  let(:menu_hash)  { { 'Cafe Latte' => '4.75', 'Cappuccino' => '3.85' } }

  let(:cafe_latte) { MenuItem.new('Cafe Latte', '4.75') }
  let(:cappuccino) { MenuItem.new('Cappuccino', '3.85') }

  it 'initializes a menu from a menu hash' do
    init_subject
    expect(menu_class).to have_received(:new).with([cafe_latte, cappuccino])
  end

  it 'can retrieve ordered items by index' do
    allow(menu).to receive(:items_at).and_return([cappuccino])
    expect(subject.order([1])).to eq Order.new([cappuccino])
    expect(menu).to have_received(:items_at).with([1])
  end

  it 'can send an sms confirmation' do
    allow(sms_sender).to receive(:send_sms)
    subject.send_sms_confirmation(to: '+44123456789', body: 'Body')

    expect(sms_sender).to have_received(:send_sms).with('+44123456789', 'Body')
  end
end