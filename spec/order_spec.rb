require 'order'

describe Order do
    
  context 'checking to see that methods exist' do
    
    it 'initializes order with a new array' do
        expect(subject).to respond_to(:current_order)
    end

    it 'initializes order with a new array' do
        expect(subject).to respond_to(:add_items)
    end

    it 'initializes order with a new array' do
        expect(subject).to respond_to(:print_order)
    end
  end

  context 'checking to see if values being passed returns the expected output (no double)' do

    it 'returns a message when there are no items in the order' do
        expect{subject.print_order}.to output("No items added yet\n").to_stdout
        end

  end

  context 'checking to see if values being apssed returns the expected output (manual values)' do
    menu_items = Order.new

    it 'adds an item to the current order' do
        menu_items.add_items({item: 'Pork', price: 10.0})
        menu_items.add_items({item: 'Salad', price: 8.5})
        expect(menu_items.current_order.length).to eq(2)
      end   
  
    it 'returns the content of the current order' do
       expect{menu_items.print_order}.to output("1. Pork, 10.0\n2. Salad, 8.5\n").to_stdout
    end
  end

end