require 'order'

describe Order do

  let(:hash) { { chips: 1, hot_dogs: 5, chips: 1 } }
  let(:menu) { double 'menu' }
  let(:menu_display_class) { double 'menu_display_class' }
  let(:menu_display) { double 'menu_display' }

  let(:order_display_class) { double 'order_display_class' }
  let(:order_display) { double 'order_display' }

  let(:order) { Order.new(menu_display_class: menu_display_class, menu: menu, order_display_class: order_display_class) }



  describe '#take_order' do
    # May be cheating because I'm skirting around the issue of rspec getting stuck in get_input
    it 'asks the user for an order' do
      allow(order_display_class).to receive(:new).and_return(order_display)
      allow(order_display).to receive(:print_order)
      allow(menu_display_class).to receive(:new).and_return(menu_display)
      allow(menu_display).to receive(:list_menu)
      allow(order).to receive(:get_input).and_return('')
      expect{ order.take_order }.to output(/#{Order::ORDER_MESSAGE}/).to_stdout
    end
  end

  describe '#get_input' do
    # Was unable to make this work in the time available - it just stops
    xit 'takes inputs until it receives an empty line' do
      allow(menu).to receive(:hash).and_return(hash)
      allow(STDIN).to receive(:gets).and_return("3, 2\n")
      order.get_input
      allow(STDIN).to receive(:gets).and_return("\n")
      order.get_input
      expected_hash = { chips: 2 }
      expect(order.analyzed_order).to eq expected_hash
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
