require 'order'

describe Order do
  let(:order) { described_class.new }  

  it 'creates a new order' do
    expect(Order.new).to be_instance_of Order
  end

  context ' #show_menu' do
    let(:expected_output) { ["Costa del Oval Menu",
                             "1. Veggie Burger and Sweet Potato Fries: £3",
                             "2. Veggie Lasagna: £5",   
                             "3. Falafel and Hallumi Wrap: £4"].join("\n") + "\n" 
    }

    it 'shows entire menu list' do
      expect { order.show_menu }.to output(expected_output).to_stdout
    end
  end

  context ' #select_items' do
    it 'should responds to #select_items' do
      expect(subject).to respond_to(:select_items).with(1).argument
    end

    it 'raises error if the customer enters an invalid number' do
      expect { subject.select_items(5) }.to raise_error "Invalid number, please choose again"
    end

    it 'returns item name when given customers choice' do
      expect(order.select_items(1)).to eq("Veggie Burger and Sweet Potato Fries")
    end
  end
end
