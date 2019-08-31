require './lib/takeaway'

describe Takeaway do
  subject          { init_subject }

  let(:sms_class)  { class_double('SMSSender', new: sms_sender) }
  let(:sms_sender) { instance_double('SMSSender') }

  let(:menu_class) { class_double('Menu', new: menu) }
  let(:menu)       { instance_double('Menu') }

  let(:menu_hash)  { { 'Cafe Latte' => '4.75', 'Cappuccino' => '3.85' } }
  let(:cafe_latte) { MenuItem.new('Cafe Latte', '4.75') }
  let(:cappuccino) { MenuItem.new('Cappuccino', '3.85') }

  def init_subject
    described_class.new(sms_class, menu_class, menu_hash)
  end

  it 'initializes with default Menu class' do
    expect(described_class.new.menu).to be_instance_of Menu
  end

  it 'initializes with default SMSSender class' do
    class TestableTakeaway < Takeaway; attr_reader :sms_sender; end
    expect(TestableTakeaway.new.sms_sender).to be_instance_of SMSSender
  end

  it 'initializes a menu with menu items from a hash' do
    init_subject
    expect(menu_class).to have_received(:new).with([cafe_latte, cappuccino])
  end

  it 'returns a copy of the menu object' do
    allow(menu).to receive(:dup)

    expect(subject.menu).not_to be menu
    expect(menu).to have_received(:dup)
  end

  it 'can retrieve ordered items by index' do
    allow(menu).to receive(:items_at).and_return([cappuccino])

    expect(subject.order([1])).to be_instance_of Order
    expect(menu).to have_received(:items_at).with([1])
  end

  it 'can send an sms confirmation' do
    allow(sms_sender).to receive(:send_sms)
    subject.send_sms_confirmation(to: '+44123456789', body: 'Body')

    expect(sms_sender).to have_received(:send_sms).with('+44123456789', 'Body')
  end
end