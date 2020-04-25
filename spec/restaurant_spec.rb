require 'restaurant'

describe Restaurant do
  subject { described_class.new(menu, order) }
  let(:menu) { instance_double 'Menu' }
  let(:order) { instance_double 'Order' } 

  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:select_dish).with(2).arguments }
  it { is_expected.to respond_to(:view_basket) }

  describe '#view_menu' do
    it 'returns a menu of dishes with prices' do
      allow(menu).to receive(:print_menu).and_return('Fish & Chips £4')

      expect(subject.view_menu).to eq 'Fish & Chips £4'
    end
  end

  describe '#select_dish' do
    it 'adds a dish to the basket' do
      expect(order).to receive(:add_to_basket).with('Burger', 1)

      subject.select_dish('Burger', 1)
    end
  end

  describe '#amend_basket' do
    it 'removes a dish from the basket' do
      expect(order).to receive(:remove_from_basket).with('Steak', 2)

      subject.amend_basket('Steak', 2)
    end
  end

  describe '#view_basket' do
    it 'returns the dishes in the basket' do
      expect(order).to receive(:basket).and_return({"Burger" => 3, "Steak" => 3})

      expect(subject.view_basket).to eq '3 x Burger, 3 x Steak'
    end
  end
end
