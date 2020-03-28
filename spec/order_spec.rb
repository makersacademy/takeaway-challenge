require 'order'

describe Order do

  # Dish instance doubles
  let(:pie_inst) { double(:pie, name: "Pie", price: 6, details: "Pie (£6)") }
  let(:mash_inst) { double(:mash, name: "Mash", price: 4, details: "Mash (£4)") }
  let(:chips_inst) { double(:chips, name: "Chips", price: 5, details: "Chips (£5)") }

  # Menu instance double that can provide dish doubles based on #provide_dish with different arguments
  let(:menu_inst) do 
    menu_inst = double(:menu)
    allow(menu_inst).to receive(:provide_dish).with(1).and_return(pie_inst)
    allow(menu_inst).to receive(:provide_dish).with(2).and_return(mash_inst)
    allow(menu_inst).to receive(:provide_dish).with(3).and_return(chips_inst)
    menu_inst
  end

  # Order with mock menu instance
  let(:mock_menu_order) { Order.new(menu_inst) }

  describe '#add and #basket' do
    it 'adding a dish to the order shows that dish in the order basket' do
      mock_menu_order.add(1)
      expect(mock_menu_order.basket).to eq "Your order:\n1x Pie (£6) - £6\nTotal: £6"
    end
  
    it 'adding a two dishes to the order shows both dishes in the order basket' do
      mock_menu_order.add(1)
      mock_menu_order.add(2)
      expect(mock_menu_order.basket).to eq "Your order:\n1x Pie (£6) - £6\n1x Mash (£4) - £4\nTotal: £10"
    end
  end
end
