
require_relative '../lib/order'

describe 'Feature tests' do

ramen = Dish.new("Beef Ramen", 8.50)
gyoza = Dish.new("Duck Gyoza", 5)
squid = Dish.new("Chilli Squid", 6)
wagamamas = Menu.new
saturday_night = Order.new(wagamamas)
text_message = Message.new

  context 'User Story 1:' do
    it 'displays a list of dishes with prices' do
      wagamamas.add(ramen)
      wagamamas.add(gyoza)
      wagamamas.add(squid)
      list = "Beef Ramen - £8.50\nDuck Gyoza - £5.00\nChilli Squid - £6.00\n"
      expect(wagamamas.read).to eq list
    end
  end

  context 'User Story 2:' do
    it 'select some number of several available dishes' do
      saturday_night.add("Beef Ramen", 1)
      saturday_night.add("Chilli Squid", 2)
      basket = "1X Beef Ramen - £8.50\n2X Chilli Squid - £12.00\n"
      expect(saturday_night.view_basket).to eq basket
    end
  end

  context 'User Story 3:' do
    it 'checks that the total matches sum of the various dishes in my order' do
      expect(saturday_night.total).to eq "Your total is £20.50"
    end
  end

  # context 'User Story 4:' do
  #   it 'receive a text after ordering' do
  #     delivery_time = (Time.now + 3600).strftime("%H:%M")
  #     message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  #     saturday_night.checkout(20.50)
  #     expect(text_message.send(Time.now)).to eq message
  #   end
  # end

end
