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
      .and_return('Mock SMS notification has received #send')
    notification_inst
  end

  # Order with mock menu instance and notification instance
  let(:mocked_order) { Order.new(menu_inst, notification_inst) }

  describe '#view_menu' do
    it 'returns the list of dishes of the menu of the order' do
      expect(mocked_order.view_menu).to eq "1. Pie (£6)\n2. Mash (£4)\n3. Chips (£5)"
    end
  end

  describe '#place' do
    it 'passing ("pie", 1, 6) returns true' do
      expect { mocked_order.place("pie", 1, 6) }.to_not raise_error
    end
    it 'passing ("pie", 1, 4) returns raises error' do
      expect { mocked_order.place("pie", 1, 4) }.to raise_error 'Total provided does not match calculated total'
    end
    it 'passing ("pie", 1, "mash", 1, 10) returns true' do
      expect { mocked_order.place("pie", 1, "mash", 1, 10) }.to_not raise_error
    end
    it 'passing ("pie", 2, "mash", 1, 16) returns true' do
      expect { mocked_order.place("pie", 2, "mash", 1, 16) }.to_not raise_error
    end
    it 'passing ("pie", 40, "mash", 12, "chips", 7, 323) returns true' do
      expect { mocked_order.place("pie", 40, "mash", 12, "chips", 7, 323) }.to_not raise_error
    end
    it 'edge case: passing ("pie", 1, "mash", 10) raises error' do
      expect { mocked_order.place("pie", 1, "mash", 10) }.to raise_error 'Incorrect arguments: each dish is followed by quantity, finally total cost'
    end
    it 'edge case: passing ("pie", 2, 1, 10) raises error' do
      expect { mocked_order.place("pie", 2, 1, 10) }.to raise_error 'Incorrect arguments: each dish is followed by quantity, finally total cost'
    end
    it 'a correct order causes a notification to be sent' do
      expect(notification_inst).to receive(:send)
      mocked_order.place("pie", 1, 6)
    end
  end
end
