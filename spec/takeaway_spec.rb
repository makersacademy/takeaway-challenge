require 'takeaway'
require 'order'
require 'menu'



describe Takeaway do

  
  # order = Order.new
  let(:order_dbl) { double :order_dbl }
  
  
  # allow(order_dbl).to_receive(:add).and_return([{"Hoisin Duck" => 10}])

  context '#add' do
    it 'should add items to order' do
      allow(order_dbl).to receive(:add).and_return([{"Hoisin Duck" => 10}])
      expect(order_dbl.add).to eq([{"Hoisin Duck" => 10}])
      expect(subject.current_order).to eq([{"Hoisin Duck"=>10}])
    end
  end

  context '#display' do 
    it 'should show the menu' do
      expect(subject.display_menu).to be_a_kind_of(Hash)
    end
  end

  context '#receipt' do
    it 'validates order total when total is correct' do
      subject.add
      expect(subject.receipt).to eq(10)
    end
  end
end