require './docs/takeaway.rb'

describe Takeaway do

    it 'shows full menu with prices when required' do
      expect(subject.show_menu).to eq subject.show_menu
    end

    it 'expects the price of "penne alfredo" to be 7 pounds' do
      expect(subject.menu['penne alfredo']).to eq 6
    end

    it 'receives an order and calculates the total cost of items' do
      subject.order('ceaser salad', 'baby back ribs', 'ice cream')
      expect(subject.bill).to eq '£14.00'
    end

    it 'sends confirmation of order and estimated arrival time' do
      time_of_arrival = Time.new + 3600
      expect(subject.place_order).to eq "Thank you! Your order was placed and will be delivered before #{time_of_arrival}"
    end


end
