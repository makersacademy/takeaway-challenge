require 'order'

describe Order do
  subject { described_class.new(menu) }
  let(:menu) { instance_double 'Menu' }

  it { is_expected.to respond_to(:add_to_basket).with(2).arguments }
  it { is_expected.to respond_to(:remove_from_basket).with(2).arguments }

  it 'starts with an empty basket' do
    expect(subject.basket).to be_empty
  end

  describe '#add_to_basket' do
    it 'adds a dish to the basket' do
      dish = 'Burger'
      qty = 1

      expect { subject.add_to_basket(dish, qty) }
      .to change { subject.basket }.to include({ 'Burger' => 1 })
    end
  end

  describe '#remove_from_basket' do
    it 'removes a dish from the basket' do
      dish = 'Burger'
      qty = 1
      subject.add_to_basket(dish, qty)
      
      expect { subject.remove_from_basket(dish, qty) }
      .to change { subject.basket['Burger'] }.by -1
    end
  end
end
