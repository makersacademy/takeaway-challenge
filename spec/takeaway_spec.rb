require 'takeaway'

describe Order do
  let(:itemA) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  let(:itemB) { double("itemB", :name => "Steamed rice", :price => 4.49) }
  let(:itemC) { double("itemC", :name => "Sesame prawn toast", :price => 7.99) }
  let(:itemD) { double("itemD", :name => "Salt & pepper pork ribs", :price => 9.95) }
  let(:itemE) { double("itemE", :name => "Cantonese lemon chicken", :price => 8.95) }
  let(:itemF) { double("itemF", :name => "Lamb in black pepper sauce", :price => 7.99) }
  let(:menu) { double("menu", :import => [itemA, itemB, itemC, itemD, itemE, itemF], 
    :length => 6, :fetch => itemA, :map => [
      "1. #{itemA.name}, £#{itemA.price}",
      "2. #{itemB.name}, £#{itemB.price}",
      "3. #{itemC.name}, £#{itemC.price}",
      "4. #{itemD.name}, £#{itemD.price}",
      "5. #{itemE.name}, £#{itemE.price}",
      "6. #{itemF.name}, £#{itemF.price}"
    ])
  }
  let(:new_order) { Order.new(menu) }
  
  describe "#review_menu" do
    it "shows a list of dishes with prices" do
      expect(new_order.review_menu).to eq "1. Egg fried rice, £4.99
2. Steamed rice, £4.49
3. Sesame prawn toast, £7.99
4. Salt & pepper pork ribs, £9.95
5. Cantonese lemon chicken, £8.95
6. Lamb in black pepper sauce, £7.99"
    end
  end

  describe "#add_to_basket" do
    it "adds items to the basket" do
      expect { new_order.add_to_basket(1) }.to change { new_order.basket.count }.from(0).to(1)
      expect { new_order.add_to_basket(3, 2) }.to change { new_order.basket.count }.from(1).to(3)
      expect { new_order.add_to_basket(2) }.to change { new_order.basket.count }.from(3).to(4)
    end

    it "returns an error if the selected number is not on the menu" do
      expect { new_order.add_to_basket(0, 1) }.to raise_error "Input error: number doesn't appear in list"
    end

    it "returns an error if a number isn't passed as an argument" do
      expect { new_order.add_to_basket("ten", 1) }.to raise_error "Input error: number doesn't appear in list"
    end
  end

  describe "#review_order" do
    it "gives a summary of the order" do
      [1,1,3,4,6].each { |o| new_order.add_to_basket(o) }
      expect(new_order.review_order).to eq "x5 Egg fried rice: £24.95
TOTAL: £24.95"
    end
  end

  describe "#place_order" do
    it "returns an error if a basket is empty" do
      expect { new_order.place_order }.to raise_error "Basket is empty"
    end

    it "does not return an error if a basket is full" do
      new_order.add_to_basket(1)
      expect { new_order.place_order }.to_not raise_error
    end

    it "prints a thank you message with the correct time on successful order" do
      dum_time = instance_double("Time", :hour => 17, :min => 52)
      new_order.add_to_basket(1)
      expect(new_order.place_order(dum_time)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end

  end

end
