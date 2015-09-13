require 'customer'

describe Customer do

  describe "#order" do

    it { is_expected.to respond_to(:place_order).with(2).argument }

    it "can view menu" do
      expect(subject.display_menu).to eq ({ "crispy chilli beef" => 5,
        "sweet and sour chicken" => 4,
        "egg fried rice" => 2 })
    end

    it "raises an error if chosen dish is not on menu" do
     expect{ subject.place_order("spring rolls", 3) }.to raise_error
     "This dish is not on the menu"
    end

    it "can chose a dish and quantity" do
      subject.place_order("crispy chilli beef", 2)
      expect( subject.order["crispy chilli beef"] ).to eq(2)
    end

    it "will add to quantity if same dish is ordered again" do
      subject.place_order("crispy chilli beef", 1)
      subject.place_order("crispy chilli beef", 1)
      expect(subject.order["crispy chilli beef"]).to eq(2)
    end

    it "add up total of dishes" do
      subject.place_order("crispy chilli beef", 1)
      subject.place_order("sweet and sour chicken", 2)
      expect(subject.total_cost).to eq(13)
    end

  end

  describe "#payment" do

    it "give a receipt of total order" do
      subject.place_order("crispy chilli beef", 1)
      subject.place_order("sweet and sour chicken", 2)
      expect(subject.receipt).to eq ("crispy chilli beef x1, sweet and sour chicken x2")
    end

    it "raises an error is payment requested doensn't match total" do
      subject.place_order("crispy chilli beef", 2)
      expect{subject.charge(6)}.to raise_error
      "Payment does not match total"
    end

    it "if payment is accepted, text notification is sent" do
      subject.place_order("crispy chilli beef", 2)
      subject.total_cost
      expect(subject.charge(10)).to eq "Your message was sent"
    end

  end

end
