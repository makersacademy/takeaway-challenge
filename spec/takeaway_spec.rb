require './docs/takeaway.rb'

describe Takeaway do

  subject(:restaurant) {described_class.new}

    it 'expects the price of "penne alfredo" to be 7 pounds' do
      expect(restaurant.menu['penne alfredo']).to eq 6
    end

    it 'expects the price of 5 ceaser salads £17.50' do
      restaurant.order('ceaser salad', 5)
      expect(restaurant.bill).to eq '£17.50'
    end

    it 'expects the price of 5 ceaser salads and 2 pizzas to be £28.50' do
      restaurant.order('ceaser salad', 5)
      restaurant.order('pizza', 2)
      expect(restaurant.bill).to eq '£28.50'
    end

    it 'receives an order and order can be viewed before checkout' do
      restaurant.order('arancini', 'cheesecake')
      expect(restaurant.table_order).to eq [["arancini", "cheesecake"]]
    end

    it 'sends confirmation of order and estimated arrival time' do
      time_of_arrival = (Time.new + 3600).strftime("%H:%M")
      restaurant.order('maki rolls', 2)
      restaurant.order('california roll', 4)
      expect(restaurant.place_order).to eq "Thank you! Your order was placed and will be delivered before #{time_of_arrival} totalling £30.00"
    end


end
