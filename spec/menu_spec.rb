require "menu"

describe Menu do
  describe "#see_list" do
    # let (:dish) { double "dish", name: name, price: price }
    it "returns a list of dishes" do
      expect(subject.see_list()).to eq subject.list
    end
  end

  describe "#place_order" do
    
    it "creates a list of selected dishes" do
      subject.place_order(1, 2)
      expect(subject.order).to eq subject.list.slice(1, 2)
    end

    it "returns a total cost for the meal" do
      expect(subject.place_order(1, 2)).to eq 9
    end
  end

  describe "#verify_order" do
    it "shows the total alongside the dishes ordered" do
      subject.place_order(1, 2)
      expect(subject.verify_order).to eq "Your total is £#{subject.total} for the following #{subject.order}"
    end
  end

  describe "#confirm_order" do
    
    it "creates a message confirming delivery before 1 hours time" do
      subject.place_order(1, 2)
      t = Time.new
      hour_plus1 = ((t.strftime("%H").to_i) + 1)
      subject.confirm_order
      expect(subject.delivery_message).to eq "Thank you! Your order was placed and will be delivered before #{t.strftime("at #{hour_plus1}:%M%p")}"
    end

    it "uses the send_text method to send delivery_message" do
      expect(subject.confirm_order).to be_truthy
    end

  end

  describe "#send_text" do
    it "Sends an SMS with the delivery message" do
      tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82"
      tw_test_token = "2bf2f033df709c2079d8ee1182a16315"
      tw_testnum = "+15005550006"
      subject.confirm_order
      expect(subject.send_text(tw_testacc_sid, tw_test_token, tw_testnum)).to be_truthy
      p subject.send_text(tw_testacc_sid, tw_test_token, tw_testnum)
    end

      # tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82"
      # tw_test_token = "2bf2f033df709c2079d8ee1182a16315"
  end
end
