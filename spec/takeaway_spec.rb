require "takeaway"

describe TakeAway do
  dish = "fish and chips"
  price = 6.99
  describe "#show_menu" do
    it "displays a list of food with prices" do
      expect{subject.show_menu}.to output("[0]= fish and chips: £6.99\n").to_stdout
    end
  end

  describe "#new_order" do
    it "allows users to create a new order" do
      subject.new_order()
      expect(subject.new_order.class).to eq Order

    end
  end

  describe "#add_to_order" do
    context "when the item is valid" do
      it "allows the user to select a quantity of an item from the menu" do
        subject.new_order
        subject.add_to_order(0,2)
        expect(subject.instance_variable_get(:@order).items[0][:item].dish).to eq "fish and chips"
      end
    end
    context "when the item is invalid" do
      it "throws an error" do
        subject.new_order
        expect{subject.add_to_order("bacon",2)}.to raise_error "invalid item"
      end
    end
  end

  describe "#check_total" do
    it "displays the total of the current order" do
      subject.new_order
      subject.add_to_order(0,2)
      expect(subject.check_total).to eq(subject.instance_variable_get(:@menu)[0].price * 2)
    end
  end

  describe "#submit_order" do
    it "sends the useer a message saying when their order will arrive" do
      
    end

    it "resets the order variable" do
      subject.new_order
      subject.add_to_order(0,2)
      subject.submit_order
      expect(subject.instance_variable_get(:@order)).to eq nil
      
    end
  end

end