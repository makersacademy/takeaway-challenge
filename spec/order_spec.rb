require 'order'

describe Order do

  let(:dish1)    { double :dish, :name => "Sushi", :price => 7 }
  let(:mockMenu) { double :menu, :list => [dish1, dish1, dish1] }

  describe "#add_item" do
    it "adds a menu to the order" do
      expect { subject.add_item(mockMenu.list[0])}.to change{ subject.order_items.length }.by 1
    end
  end

  describe "#print_total" do
    it "prints the running total cost of the order" do
      2.times { subject.add_item(mockMenu.list[0]) }
      expect(subject.print_total).to eq "The running total of your order is £14"
    end
  end

  describe "#print_order" do
    it "prints out the order details" do
      2.times { subject.add_item(mockMenu.list[0]) }
      expect(subject.print_order).to eq "Your order details are: Sushi, £7 | Sushi, £7 | "
    end
  end

  describe "#place_order" do
    it "raises an error if the total provided does not match" do
      2.times { subject.add_item(mockMenu.list[0]) }
      expect { subject.place_order(25) }.to raise_error("Incorrect total, please try again")
    end
  end

  #send_message currently has no tests

end

@food = [Dish.new("Sushi", 7), Dish.new("Udon",5), Dish.new("Ramen",8)]