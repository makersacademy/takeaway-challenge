require 'restaurant'

describe Restaurant do
  subject { described_class.new(menu, order, text) }
  let(:menu) { instance_double 'Menu' }
  let(:order) { instance_double 'Order' }
  let(:text) { instance_double 'Text' }

  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:select_dish).with(2).arguments }
  it { is_expected.to respond_to(:view_basket) }
  it { is_expected.to respond_to(:place_order) }
  it { is_expected.to respond_to(:send_text)}

  describe '#view_menu' do
    it 'returns a menu of dishes with prices' do
      expect(menu).to receive(:print_menu)

      subject.view_menu
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
    it 'returns the dishes in the basket and the total' do
      expect(order).to receive(:basket_total)

      subject.view_basket
    end
  end

  describe '#place_order' do
    it 'places the order' do
      expect(order).to receive(:prepare_order)

      subject.place_order
    end
  end

  describe '#send_text' do
    it 'sends an sms message' do
      allow(order).to receive(:basket).and_return({ 'Burger' => 2, :ready => true })

      expect(text).to receive(:send_sms)

      subject.send_text
    end
  end
end
