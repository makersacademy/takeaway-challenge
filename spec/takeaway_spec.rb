require "takeaway"

describe Order do
  
  describe "#review_menu" do
    it "shows a list of dishes with prices" do
      expect(subject.review_menu).to eq "1. Egg fried rice, £4.99
2. Steamed rice, £4.49
3. Sesame prawn toast, £7.99
4. Salt & pepper pork ribs, £9.95
5. Cantonese lemon chicken, £8.95
6. Lamb in black pepper sauce, £7.99"
    end
  end

  describe "#review_order" do
    it "gives a summary of the order" do
      [1,1,3,4,6].each { |o| subject.add_to_basket(o) }
      expect(subject.review_order).to eq "x2 Egg fried rice: £9.98
x1 Sesame prawn toast: £7.99
x1 Salt & pepper pork ribs: £9.95
x1 Lamb in black pepper sauce: £7.99
TOTAL: £35.91"
    end
  end

  describe "#add_to_basket" do
    it "adds an item to the basket" do
      expect { subject.add_to_basket(1) }.to change { subject.menu[0][:quant] }.from(0).to(1)
      expect { subject.add_to_basket(1) }.to change { subject.menu[0][:quant] }.from(1).to(2)
      expect { subject.add_to_basket(2) }.to change { subject.menu[1][:quant] }.from(0).to(1)
    end

    it "returns an error if the selected number is not on the menu" do
      expect { subject.add_to_basket(0) }.to raise_error "Input error: number doesn't appear in list"
    end

    it "returns an error if a number isn't passed as an argument" do
      expect { subject.add_to_basket("ten") }.to raise_error "Input error: number doesn't appear in list"
    end
  end

  describe "#place_order" do
    it "returns an error if a basket is empty" do
      expect { subject.place_order }.to raise_error "Basket is empty"
    end

    it "does not return an error if a basket is full" do
      subject.add_to_basket(1)
      expect { subject.place_order }.to_not raise_error
    end

    it "prints a thank you message with the correct time on successful order" do
      dum_time = instance_double("Time", :hour => 17, :min => 52)
      subject.add_to_basket(1)
      expect(subject.place_order(dum_time)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end

  end

end
