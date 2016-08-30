require "take_away"
describe TakeAway do
  let(:take_away) {double :take_away}
  context "#show_dishes" do
    it "returns list of dishes " do
      allow(take_away).to receive(:show_dishes).and_return(:dish_list)
      expect(take_away.show_dishes).to eq :dish_list
    end
  end
  context "#place_order" do
    it "selects several dishes and confirms placed order" do
      time1 = Time.now
      time2 = "#{time1.hour+1}"+":"+"#{time1.min}"
      order_placed_message = "Thank you! Your order was placed and will be delivered before #{time2}"
      allow(take_away).to receive(:place_order).and_return(order_placed_message)
      expect(take_away.place_order("Pizza Tuna",2, "Pizza Johannesburg",0,14)).to eq order_placed_message
    end
    it "raises error if total price does not equal sum of dishes" do
      message = "given total price does not equal sum of dishes"
      allow(take_away).to receive(:place_order).and_raise(message)
      expect{take_away.place_order("Pizza Tuna",2,"Pizza Johannesburg",0,10)}.to raise_error message
    end

    it "returns current hour minute + 1 hours" do
      time1 = Time.now
      time2 = "#{time1.hour+1}"+":"+"#{time1.min}"
      expect(subject.current_time).to eq time2
    end 
  end
end
