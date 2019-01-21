require 'order'

describe Order do

  let(:hash) { { chips: 1, hot_dogs: 5, peanuts: 1 } }
  let(:menu) { double 'menu' }

  let(:phone_class) { double 'phone_class' }
  let(:phone) { double 'phone' }

  let(:menu_display_class) { double 'menu_display_class' }
  let(:menu_display) { double 'menu_display' }

  let(:order_display_class) { double 'order_display_class' }
  let(:order_display) { double 'order_display' }

  let(:totalizer_class) { double 'totalizer_class' }
  let(:totalizer) { double 'totalizer' }

  let(:order) { Order.new(
    menu_display_class: menu_display_class,
    menu: menu,
    order_display_class: order_display_class,
    totalizer_class: totalizer_class,
    phone_class: phone_class)
  }

  describe '#take_order' do
    it 'asks the user for an order (stubbing #take_input)' do
      allow(order_display_class).to receive(:new).and_return(order_display)
      allow(order_display).to receive(:print_order)
      allow(menu_display_class).to receive(:new).and_return(menu_display)
      allow(menu_display).to receive(:list_menu)
      allow(order).to receive(:take_input).and_return('')
      expect { order.take_order }.to output(/#{Order::ORDER_MESSAGE}/).to_stdout
    end
  end

  describe '#take_input' do
    it 'takes inputs until it receives an empty line' do
      allow(menu).to receive(:hash).and_return(hash)
      allow(STDIN).to receive(:gets).and_return("\n")
      order.take_input
      expect(order.analyzed_order).to eq Hash.new
    end

    it 'confirms the order if it receives the right number (this test sends a text unless stubbing #send_text)' do
      allow(order).to receive(:correct_total).and_return(10.5)
      allow(menu).to receive(:hash).and_return(hash)
      allow(STDIN).to receive(:gets).and_return("10.50\n")
      allow(phone_class).to receive(:new).and_return(phone)
      allow(phone).to receive(:send_text)
      order.take_input
      expect(order.order_confirmed).to be true
    end

    it 'complains if it receives the wrong number' do
      # Just to be able to escape the loop on line 'break if order_confirmed'
      order.instance_variable_set(:@order_confirmed, true)

      allow(order).to receive(:correct_total).and_return(10.5)
      allow(menu).to receive(:hash).and_return(hash)
      allow(STDIN).to receive(:gets).and_return("999\n")
      expect { order.take_input }.to output(/Oops! You gave a wrong total./).to_stdout
    end
  end

  describe '#analyze' do
    it 'converts the order into a hash of the items and the quantities' do
      allow(menu).to receive(:hash).and_return(hash)
      allow(menu_display).to receive(:menu).and_return(menu)

      order.analyze('2, 3')
      order.analyze('1, 1')

      expected_hash = { hot_dogs: 3, chips: 1 }
      expect(order.analyzed_order).to eq expected_hash
    end
  end

  describe '#menu_nouns' do
    it 'finds any menu items in the input line, returning them in the same form as the menu hash key (symbol)' do
      allow(menu).to receive(:hash).and_return(hash)
      allow(menu_display).to receive(:menu).and_return(menu)

      expect(order.menu_nouns('2, 3')).to eq :hot_dogs
    end
  end

end
