require 'takeaway'

describe Takeaway do

  describe "#order" do
    it "should be an array" do
      expect(subject.order).to eq []
    end
  end

  describe "#take_order" do

    it "should ask the customer to place their order" do
      allow(subject).to receive(:gets).and_return('')
      expect { subject.take_order }.to output("\nWhat would you like to order?\nPlease enter a menu line number (e.g. 1 for chips) or push enter to place your order.\n-----------------------------------\nTotal             : £00\n").to_stdout
    end
    # it "should ask the customer for the quantity" do
    #   allow(subject).to receive(:gets).and_return('2')
    #   expect { subject.take_order }.to output("\nWhat would you like to order?\nPlease enter a menu line number (e.g. 1 for chips) or push enter to place your order.\n").to_stdout
    # end
  end

  describe "#print_receipt" do
    it "should print all items ordered, their cost and a total" do
      subject.order = [{:desc=>"Chips", :cost=>1.0, :count=>2}, {:desc=>"Burger", :cost=>3.5, :count=>2}, {:desc=>"Coke", :cost=>0.8, :count=>4}]
      expect{ subject.print_receipt }.to output("Chips @ 1.0 x 2   : £2.00\nBurger @ 3.5 x 2   : £7.00\nCoke @ 0.8 x 4   : £3.20\n-----------------------------------\nTotal             : £12.20\n").to_stdout
    end
  end
end
