require 'order'

describe Order do

  let(:italian_menu) { double() }
  let(:subject) { described_class.new(italian_menu) }
  it { is_expected.to respond_to(:order_items) }
  it { is_expected.to respond_to(:add_item).with(2).arguments }

  it 'is bound to a menu on creation' do
    subject = described_class.new(italian_menu)
    expect(subject.menu).to eq(italian_menu)
  end

  describe '#add_item' do

  end
end
