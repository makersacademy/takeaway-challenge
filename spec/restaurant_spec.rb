require 'restaurant'

describe Restaurant do 
  subject(:restaurant) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:dishes) { { "jollof rice": 6, "jerk chicken": 8 } }
  let(:printed_menu) { "Jollof rice: £6.00, Jerk chicken: £8.00" } 
    
  it 'shows menu of dishes and prices' do 
    expect(restaurant.print_menu).to eq(printed_menu)
  end

  describe '#add_to_order' do    
    let(:mock_order_instance) { double() }
    let(:mock_order) { double(new: mock_order_instance) }   
    let(:restaurant) { described_class.new(mock_order, menu: menu) }      
    
    it 'adds dishes to current order' do
      allow(menu).to receive(:dishes).and_return(dishes)      
      restaurant.add_to_order("Jollof rice", 2)
      restaurant.add_to_order("Jerk chicken", 3)
      
      expect(restaurant.current_order).to eq([mock_order_instance, mock_order_instance])
    end

    it 'only adds dishes that are on the menu' do
      message = "Cannot add to order: Item is not on menu"      
      allow(menu).to receive(:dishes).and_return(dishes)
            
      expect { restaurant.add_to_order("cake") }.to raise_error message
    end

    it 'adds cost of order to total' 
  end

  describe '#view_order' do
    it 'shows current order & total'
  end
end
