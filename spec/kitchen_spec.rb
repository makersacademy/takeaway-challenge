require 'kitchen'
require 'takeaway'

describe Kitchen do

  subject { described_class.new(menu_class) }
  let(:menu_class) { double(menu: { "Calamari" => 10.00, "Tomato Salad" => 10.00 }) }

  context 'instance variable' do
    it 'should be eq to object' do
      expect(subject.menu).to eq menu_class
    end
  end
  
  context 'place order' do
    it 'should raise error if not in a menu' do
      expect { subject.order "Not in menu" }.to raise_error "Can not place order: item is not in a menu"
    end

    it 'with one item' do
      subject.order "Calamari"
      expect(subject.order_cart.empty?).to eq false
    end

    it 'multiple times' do
      subject.order "Calamari"
      subject.order "Tomato Salad"
      expect(subject.order_cart.empty?).to eq false
    end
  end

  context '#order_total' do
    it 'should print order and total' do
      subject.order "Calamari"
      subject.order "Tomato Salad"
      expect { subject.order_total }.to output.to_stdout
    end
  end

end
