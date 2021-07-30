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

  describe '#order_total' do
    let(:total) { double :total}
    
    it 'shows the total order cost' do
      expect(subject.order_total).to eq :total #expected double, got nil
    end
  end

  describe '#calculate_fee' do
    it 'calculates a fee' do
    end
  end
end
