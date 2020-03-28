require 'order'

describe Order do

  # Set up mock menu
  # Dish instance doubles
  let(:pie_inst) { double(:pie, name: "Pie", price: 6, details: "Pie (£6)") }
  let(:mash_inst) { double(:mash, name: "Mash", price: 4, details: "Mash (£4)") }
  let(:chips_inst) { double(:chips, name: "Chips", price: 5, details: "Chips (£5)") }

  # Menu instance double that can provide dish doubles based on #provide_dish with different arguments
  let(:menu_inst) do 
    menu_inst = double(:menu)
    allow(menu_inst).to receive(:provide_dish).with("pie").and_return(pie_inst)
    allow(menu_inst).to receive(:provide_dish).with("mash").and_return(mash_inst)
    allow(menu_inst).to receive(:provide_dish).with("chips").and_return(chips_inst)
    allow(menu_inst).to receive(:provide_price).with("pie").and_return(6)
    allow(menu_inst).to receive(:provide_price).with("mash").and_return(4)
    allow(menu_inst).to receive(:provide_price).with("chips").and_return(5)
    allow(menu_inst).to receive(:view).and_return("1. Pie (£6)\n2. Mash (£4)\n3. Chips (£5)")
    menu_inst
  end

  # Set up mock notification service
  # Notification instance that can receive #send and return the string with 24h time an hour from now
  let(:notification_inst) do
    notification_inst = double(:notification)
    allow(notification_inst)
      .to receive(:send).with(/\d{2}:\d{2}/)
      .and_return('Mock SMS notification has recieved #send')
    notification_inst
  end

  # Order with mock menu instance and notification instance
  let(:mocked_order) { Order.new(menu_inst, notification_inst) }

  # describe '#add and #basket' do
  #   it 'adding a dish to the order shows that dish in the order basket' do
  #     mocked_order.add(1)
  #     expect(mocked_order.basket).to eq "Your order:\nPie (£6)\nTotal: £6"
  #   end
  #   it 'adding a two dishes to the order shows both dishes in the order basket' do
  #     mocked_order.add(1)
  #     mocked_order.add(2)
  #     expect(mocked_order.basket).to eq "Your order:\nPie (£6)\nMash (£4)\nTotal: £10"
  #   end
  # end

  describe '#view_menu' do
    it 'returns the list of dishes of the menu of the order' do
      expect(mocked_order.view_menu).to eq "1. Pie (£6)\n2. Mash (£4)\n3. Chips (£5)"
    end
  end

  describe '#place' do
    it 'passing ("pie", 1, 6) returns true' do
      expect(mocked_order.place("pie", 1, 6)). to eq true
    end
    it 'passing ("pie", 1, 4) returns false' do
      expect(mocked_order.place("pie", 1, 4)). to eq false
    end
    it 'passing ("pie", 1, "mash", 1, 10) returns true' do
      expect(mocked_order.place("pie", 1, "mash", 1, 10)). to eq true
    end
    it 'passing ("pie", 2, "mash", 1, 16) returns true' do
      expect(mocked_order.place("pie", 2, "mash", 1, 16)). to eq true
    end
    it 'passing ("pie", 40, "mash", 12, "chips", 7, 323) returns true' do
      expect(mocked_order.place("pie", 40, "mash", 12, "chips", 7, 323)). to eq true
    end
    it 'edge case: passing ("pie", 1, "mash", 10) raises error' do
      expect { mocked_order.place("pie", 1, "mash", 10) }. to raise_error 'Incorrect arguments: each dish is followed by quantity, finally total cost'
    end
    it 'edge case: passing ("pie", 2, 1, 10) raises error' do
      expect { mocked_order.place("pie", 2, 1, 10) }. to raise_error 'Incorrect arguments: each dish is followed by quantity, finally total cost'
    end

  end

  # describe '#place' do
  #   it 'places an order and sends a text to the user that delivery will be complete within an hour' do
  #     mocked_order.add(1)
  #     expect(mocked_order.place).to eq 'Mock SMS notification has recieved #send'
  #   end
  #   it 'raises an error if no dishes have been added' do
  #     expect { mocked_order.place }.to raise_error 'Cannot place order with an empty basket'
  #   end
  # end
end
