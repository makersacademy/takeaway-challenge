require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu)      { double('menu', print: printed_menu) }
  
  describe '#add_order' do
    subject(:order)         { described_class.new(menu) }
    let(:menu)              { double('menu', dishes: available_dishes) }
    let(:available_dishes)  {
      {
        "chicken curry": 7.99, 
        "vegetable curry": 5.99
      }
    } 
    context 'item is available' do
      before do
        allow(menu).to receive(:any?).and_return(true)
      end
      it 'adds item to order' do
        current_order = ["chicken curry"]
        order.add_order("chicken curry", 1)
        expect(order.current_order).to eq current_order
      end
    end

    context 'item is not available' do 
      before do
        allow(menu).to receive(:any?).and_return(false)
      end
      it 'raises an error if the item is not available' do

      expect{ order.add_order("chicken curry", 1) }.to raise_error "Could not add to order: Item not available"
      end
    end

  end 
end

