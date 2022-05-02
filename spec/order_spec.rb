require 'order'
require 'time'

describe Order do
  
  context "A customer can select a number of items from the menu as their order" do
    
    it "Subject responds to the pick_item method" do
      
      expect(subject).to respond_to :pick_item

    end

    it "A customer can start their order by adding an item to their order" do
      
      subject.pick_item("Pepperoni Pizza", 1)
      expect(subject.order).to eq(["Pepperoni Pizza"])

    end

    it "A customer can add multiple items to their order" do
      
      subject.pick_multi_items(["Pepperoni Pizza", "Neapolitan Pizza", "Fiorentina Pizza"])
      expect(subject.order).to eq(["Pepperoni Pizza", "Neapolitan Pizza", "Fiorentina Pizza"])

    end

    it "A customer can check their order total is correct by summing up the prices of their order items" do
      
      subject.pick_multi_items(["Pepperoni Pizza", "Neapolitan Pizza", "Fiorentina Pizza"])
      expect(subject.order_value).to eq 30

    end

    it "Raises an error when customers try to order something that's not on the menu" do
      
      expect {subject.pick_item("Hawaiian", 1) }.to raise_error("Please choose from the menu")

    end

    it "A customer can order an item multiple times in one go" do
      
      subject.pick_item("Pepperoni Pizza", 4)
      expect(subject.order).to eq(["Pepperoni Pizza", "Pepperoni Pizza", "Pepperoni Pizza", "Pepperoni Pizza"])

    end

  end

  context "A customer can place an order" do
  
    it "the time method can be used to print the current time plus one hour" do
      
      expect(subject.arrival_time).to eq (Time.now + 1 * 60 * 60).strftime("%k:%M")

    end

    it "a customer can submit their order" do
      
      subject.pick_multi_items(["Pepperoni Pizza", "Neapolitan Pizza", "Fiorentina Pizza"])
      allow(subject).to receive(:send_order_text).and_return "Text sent!"

      expect(subject.place_order).to eq "Thanks! Your order has been received and will be with you by #{subject.arrival_time}"

    end

    it "a customer gets an current order summary when adding an item to their order" do
      
      subject.pick_item("Pepperoni Pizza", 4)

      expect(subject.order_summary).to eq "Your order so far is: #{subject.simp_order}"

    end

    it "a simplified order summary gives quantities of items ordered" do
      
      subject.pick_item("Pepperoni Pizza", 4)
      subject.pick_item("Fiorentina Pizza", 4)
      subject.order_value

      expect(subject.simplify_order).to eq "4x Pepperoni Pizza 4x Fiorentina Pizza | Totalling: £#{subject.order_value}"

    end

  end

end
