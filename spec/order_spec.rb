require 'order'

describe Order do
  let(:dish1) { double :dish1, name: "dish1", price: 4.50 }
  let(:dish2) { double :dish2, name: "dish2", price: 3.00 }
  let(:dish3) { double :dish3, name: "dish3", price: 2.50 }
  let(:menu)  { double :menu, list_dishes: "list of dishes" }

  before(:each) do
    allow($stdout).to receive(:write)
    allow(menu).to receive(:select_dish) do |number|
      case number
      when 1 then dish1
      when 2 then dish2
      when 3 then dish3
      end
    end
  end

  describe "#initialize" do
    before :each do
      allow($stdin).to receive(:gets).and_return("1\n", "2\n", "\n")
      allow(menu).to receive(:select_dish).and_return(dish1)
    end

    it "should print the menu for the user to choose from" do
      expect { Order.new menu }.to output(/#{menu.list_dishes}/).to_stdout
    end

    it "should print a prompt for the user to pick a menu item" do
      regex = /Please pick a dish \(enter 0 to see the menu again\): /
      expect { Order.new menu }.to output(regex).to_stdout
    end

    it "should take user input for the dish and the quantity" do
      expect($stdin).to receive(:gets).and_return("1\n", "2\n", "\n")
      Order.new menu
    end

    it "should print a prompt for the user to pick a quantity" do
      regex = /How many dish1 would you like to add/
      expect { Order.new menu }.to output(regex).to_stdout
    end
  end

  context "making an order with multiple items" do
    before :each do
      allow($stdin).to receive(:gets)
        .and_return("1\n", "2\n", "3\n", "3\n", "2\n", "1\n", "\n")
    end

    let(:order) { Order.new menu }

    it "should return the total for the whole order" do
      expect(order.total).to eq 19.50
    end

    it "should have a summary of the order" do
      summary = "Summary:\n"
      summary << "2 x dish1 (9.00)\n"
      summary << "3 x dish3 (7.50)\n"
      summary << "1 x dish2 (3.00)\n"
      summary << "Total: 19.50"
      expect(order.summary).to eq summary
    end
    
    it "should handle incorrect inputs by repeating it's question" do
      expect($stdin).to receive(:gets)
        .and_return("not\n", "valid\n", "input\n", "1\n", "2\n", "\n")
      expect(order.total).to eq 9
    end

    it "should print the menu again if '0' is given" do
      allow($stdin).to receive(:gets)
        .and_return("1\n", "3\n", "0\n", "3\n", "1\n", "\n")
      regex = /#{menu.list_dishes}\n.*#{menu.list_dishes}/
      expect { Order.new menu }.to output(regex).to_stdout
    end

    describe "#update_order" do
      def next_input
        allow($stdin).to receive(:gets)
          .and_return("2\n", "1\n", "1\n", "-1\n", "\n")
      end

      before :each do
        order
        next_input
      end

      it "should print the menu and a summary of the order so far" do
        string = order.summary + "\n"
        string << menu.list_dishes 
        regex = Regexp.quote(string)
        expect { order.update_order }.to output(/#{regex}/).to_stdout
      end

      it "should take user input to change the order" do
        expect($stdin).to receive(:gets)
          .and_return("2\n", "1\n", "1\n", "-1\n", "\n")
        order.update_order
      end

      it "should update the order correctly" do
        order.update_order
        summary = "Summary:\n"
        summary << "1 x dish1 (4.50)\n"
        summary << "3 x dish3 (7.50)\n"
        summary << "2 x dish2 (6.00)\n"
        summary << "Total: 18.00"
        expect(order.summary).to eq summary
      end
    end
  end
end
