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
    allow(menu_inst).to receive(:provide_dish).with(1).and_return(pie_inst)
    allow(menu_inst).to receive(:provide_dish).with(2).and_return(mash_inst)
    allow(menu_inst).to receive(:provide_dish).with(3).and_return(chips_inst)
    menu_inst
  end

  # Set up mock notification service
  # Times now and one hour from now in 24h format
  let(:now) { Time.now }
  let(:hour_from_now_24h) { (Time.now + 10*60).strftime("%R") }

  # Notification instance that can receive #send and return the string with 24h time an hour from now
  let(:notification_inst) do
    notification_inst = double(:notification)
    allow(notification_inst)
      .to receive(:send).with(instance_of(Time))
      .and_return("Thank you! Your order was placed and will be delivered before #{hour_from_now_24h}")
    notification_inst
  end

  # Order with mock menu instance and notification instance
  let(:mocked_order) { Order.new(menu_inst, notification_inst) }

  describe '#add and #basket' do
    it 'adding a dish to the order shows that dish in the order basket' do
      mocked_order.add(1)
      expect(mocked_order.basket).to eq "Your order:\nPie (£6)\nTotal: £6"
    end
  
    it 'adding a two dishes to the order shows both dishes in the order basket' do
      mocked_order.add(1)
      mocked_order.add(2)
      expect(mocked_order.basket).to eq "Your order:\nPie (£6)\nMash (£4)\nTotal: £10"
    end
  end


  describe '#place' do
    it 'places an order and sends a text to the user that delivery will be complete within an hour' do
      mocked_order.add(1)
      expect(mocked_order.place).to eq "Thank you! Your order was placed and will be delivered before #{hour_from_now_24h}"
    end
  end
end
