require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu)      { double('menu', print: printed_menu) }
  
  describe '#add_order' do
    context 'item is available' do

      subject(:order)         { described_class.new(menu) }
      let(:menu)              { double('menu', dishes: available_dishes) }
      let(:available_dishes)  {
        {
          "chicken curry": 7.99, 
          "vegetable curry": 5.99
        }
      } 

      it 'adds item to order' do
        current_order = ["chicken curry"]
        order.add_order("chicken curry", 1)
        expect(order.current_order).to eq current_order
      end
    end
  end
end

