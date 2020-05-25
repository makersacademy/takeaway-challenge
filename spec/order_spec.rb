require 'order'

describe Order do
  let(:order) { described_class.new }  
  let(:menu) { double :menu }
  let(:order_choice) { double :order_choice }

  it 'creates a new order' do
    expect(Order.new).to be_instance_of Order
  end

  it 'initalizes with an empty customer basket' do
    expect(Order.new.customer_basket).to eq []
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

    it 'returns the correct item name when given customers choice' do
      allow(menu).to receive(:customer_choice)
      order.select_items(2)
      expect(order.customer_basket).to include({ :item => "Veggie Lasagna", :item_number => 2, :price => 5 })
    end
  end

  describe '#customer_order' do
    it 'should output the order in the correct format' do
      order.select_items(2)
      order.customer_order_summary
      expect(subject.customer_order_summary).to eq(subject.customer_basket)
    end
  end

  describe '#subtotal' do
      
    it { is_expected.to respond_to(:subtotal) }

    it 'returns sum of all items in customer basket' do
      customer_basket = [2, 4]
      order.select_items(2)
      order.select_items(1)
      order.customer_order_summary
      order.subtotal
      subtotal_test = order.subtotal
      expect(order.subtotal)clear.to eq(subtotal_test)
    end
  end
end

    # let(:item_number) { double "item_number_double" }
    # let(:item) { double "food_double" }
    # let(:price) { double "price_double" }

    # it 'adds order to customer_basket' do
    #   customer_choice = 2
    #   item = 
    #   allow(menu).to receive(:customer_choice)
    #   expect(subject.select_items(2)).to eq("Veggie Lasagna")
    # end
  # end
  
  # describe ' #order_asker' do
  # let (:user_input) { 2 }
  # customer_choice = 2

  #   xit 'asks user what they want to order and returns it' do
  #     allow(subject.order_asker).to receive(:gets).and_return(customer_choice)
  #     subject.order_asker = 2
  #     expect(subject.order_asker).to eq(customer_choice)
  #   end
  # end
