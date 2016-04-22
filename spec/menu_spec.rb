require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }
  let(:price) { double :price }

  it { is_expected.to respond_to(:read)}

  describe '#add' do
    it 'adds dishes to menu' do
      expect{ menu.add(:dish, :price) }.to change{ menu.menu_list.size }.by(1)
    end
  end

  describe '#read' do
    it 'displays menu' do
      expect(menu.read).to eq menu.menu_list
    end
  end

  describe '#price' do
    it 'shows price of a dish' do
      menu.add(:dish, :price)
      expect(menu.price(:dish)).to eq :price
    end
  end


end
