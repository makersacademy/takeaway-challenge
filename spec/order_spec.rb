require 'order'

describe Order do
  describe "#request_item" do
    it "should add a menu item to the order" do
      subject.request_item('Lunch')
      expect(subject.order[0]).to eq({ :Lunch => 2 })
    end
    it "can add multiple items to the order at once" do
      subject.request_item('Lunch', 'Dinner', 'Breakfast')
      expect(subject.order.length).to eq 3
    end
  end
  describe "#total_price" do
    it "should give the price of the ordered items" do
      subject.request_item('Lunch', 'Dinner')
      expect(subject.total_price).to eq 5
    end
  end
  describe "#print_menu" do
    it "should print the list of menu items" do
      expect { subject.print_menu }.to output.to_stdout
    end
  end
  describe "#print_order" do
    it "should print the items in the current order" do
      expect {subject.print_order }.to output.to_stdout
    end
  end
end
