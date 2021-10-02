require "menu"

describe Menu do
  describe "#see_list" do
    # let (:dish) { double "dish", name: name, price: price }
    it "returns a list of dishes" do
      expect(subject.see_list()).to eq subject.list
    end
  end

  describe "#place_order" do
    # let (:dish) { double "dish", name: name, price: price }
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
      expect(subject.verify_order).to eq "Your total is #{subject.total} for the following #{subject.order}"
    end
  end

  describe "#confirm_order" do
    it "sends a message confirming delivery before 1 hours time" do
      subject.place_order(1, 2)
      t = Time.new
      hour_plus1 = ((t.strftime("%H").to_i) + 1)
      expect(subject.confirm_order).to eq "Thank you! Your order was placed and will be delivered before #{t.strftime("at #{hour_plus1}:%M%p")}"
      p t.strftime("at %H:%M%p")
    end
  end
end
