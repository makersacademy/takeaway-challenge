require 'order'

describe Order do
  subject { described_class.new(menu) }
  let(:menu) { instance_double 'Menu' }

  it { is_expected.to respond_to(:add_to_order).with(2).arguments }

  it 'starts with an empty basket' do
    expect(subject.basket).to be_empty
  end

  describe '#add_to_order' do
    it 'adds a dish to the basket' do

    end
  end
end
