require_relative '../lib/takeaway'

describe Takeaway do
  let (:menu_double) { double(:menu, list_items: ("Korma: £8.50\n" +
                                                  "Jalfrezi: £9.00\n" +
                                                  "Tikka Masala: £8.00")) 
  }
  let (:empty_order_double) { double(:empty_order, total: 0.0, bill: "\nTotal: £0.00") }
  let (:empty_order_class_double) { double(:empty_order_class, new: empty_order_double) }
  let (:subject) { Takeaway.new(menu_double, empty_order_class_double) }

  let (:order_double) { double(:order, add: true, bill: "Korma: £8.50\nJalfrezi: £9.00\nTotal: £17.50") }
  let (:order_class_double) { double(:order_class, new: order_double) }
  let (:takeaway) { Takeaway.new(menu_double, order_class_double) }

  context "#creation" do
    it "shows the menu" do
      expect(subject.show_menu).to eq ("Korma: £8.50\n" +
                                        "Jalfrezi: £9.00\n" +
                                        "Tikka Masala: £8.00")
    end

    it "has no current order" do
      expect { subject.check_bill }.to raise_error "There is no current order"
    end
  end

  context "#start_new_order" do
    it "creates a new empty order" do
      subject.start_new_order
      expect(subject.check_bill).to eq "\nTotal: £0.00"
    end
  end

  context "#add_to_order" do
    it "raises an error before an order has been started" do
      expect { subject.add_to_order("Korma") }.to raise_error "There is no current order"
    end
  end

  context "#check_bill" do
    it "lets the customer check that total cost is correct before ordering" do
      takeaway.start_new_order
      takeaway.add_to_order("Korma")
      takeaway.add_to_order("Jalfrezi")
      expect(takeaway.check_bill).to eq "Korma: £8.50\nJalfrezi: £9.00\nTotal: £17.50"
    end
  end

  context "#place_order" do
    it "raises error when the customer tries to place an order without starting one" do
      expect { subject.place_order }.to raise_error "There is no current order"
    end

    it "raises error when the order is empty" do
      subject.start_new_order
      expect { subject.place_order }.to raise_error "The current order is empty"
    end
  end
end
