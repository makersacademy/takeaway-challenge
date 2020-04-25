require 'order'

describe Order do

  let(:carbonara) { double('Carbonara', name: 'Carbonara', price: '10.50')}
  let(:italian_menu) { double('Italian', items: [carbonara]) }
  let(:subject) { described_class.new(italian_menu) }
  it { is_expected.to respond_to(:order_items) }
  it { is_expected.to respond_to(:add_item).with(2).arguments }

  it 'is bound to a menu on creation' do
    subject = described_class.new(italian_menu)
    expect(subject.menu).to eq(italian_menu)
  end

  describe '#add_item' do
    it 'it adds 3 orders of "Carbonara" to order_items' do
      subject = described_class.new(italian_menu)
      expect{ subject.add_item("Carbonara", 3) }.to change { subject.order_items }.to include(carbonara => 3)
    end
  end
end
