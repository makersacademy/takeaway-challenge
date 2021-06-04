require 'order'

describe Order do
  
  let(:basket) { {:fish => 5} }
  let(:menu_double) { double show_menu:{fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2}  } 
  subject(:order) {described_class.new(menu_double)}
  let(:menu) { {fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2} }
  
  describe '#initialize' do
    it 'is initialized with an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'has an empty cost at the start' do
      expect(order.total_cost).to eq 0
    end
  end
  
  context 'when an order has already been added to the basket' do
    before(:each) { order.add_item(:fish, 5) }
      it 'adds items to the basket hash' do
        expect(order.basket).to eq basket
      end
      it 'displays the basket' do
        expect(order.show_basket).to include basket
      end
  end

  describe '#read_menu' do 
    it 'reads the menu' do
    expect(order.read_menu).to eq menu_double.show_menu
    end 
  end

end