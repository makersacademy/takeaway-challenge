require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  context "testing #new on class" do
    subject(:menu_class) { described_class }
    it { is_expected.to respond_to(:new) }
  end

  describe '#initialize' do
    it 'with empty dishes list' do
      expect(menu.dishes).to be_empty
    end
  end

  describe '#add_dish' do
    it 'adds one dish & its price to dishes list' do
      menu.add_dish("Risotto con funghi porcini", 4.25)
      expect(menu.dishes["Risotto con funghi porcini"]).to eq 4.25
    end
  end

  describe '#contains?' do
    it 'checks whether a given dish exists in dishes list' do
      menu.add_dish("Risotto con funghi porcini", 4.25)
      expect(menu.contains?("Risotto con funghi porcini")).to be true
    end
  end

end
