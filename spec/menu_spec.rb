require 'menu'

describe Takeaway do
  describe '#show_menu' do
    it 'return the menu' do
      expect(subject.show_menu).to eq subject.menu
    end
  end
  
  describe '#select_meal' do
    let(:choice) { double :choice }

    it { is_expected.to respond_to(:select_meal).with(1).argument }

    it 'stores the choices in an Order array' do
      expect(subject.select_meal(choice)).to eq subject.order
    end
  end
end
