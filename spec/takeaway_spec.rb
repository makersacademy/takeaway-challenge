require 'takeaway'

describe Takeaway do
  describe "initialization should" do
    it "initialize a menu object" do
      expect(subject.menu).to be_a(Menu)
    end
    it "initialize an array to hold active orders" do
      expect(subject.active_orders).to be_a(Array)
    end
    it "initialize an array to hold historical/completed orders" do
      expect(subject.order_history).to be_a(Array)
    end
  end

  describe "ascii_render" do
    it "outputs the banner to the console" do
      expect { subject.ascii_render }.to output.to_stdout
    end
  end

  describe "interactive_menu" do
    it "loops the menu so that the user can move between options" do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("9")
      expect { subject.interactive_menu }.to raise_error(SystemExit)
    end
  end

  describe "new_order" do
    it "should create a new order" do
      expect(subject.new_order).to be_a(Order)
    end
  end

  describe "interface_print" do
    it "outputs the interface to stdout" do
      expect { subject.interface_print }.to output.to_stdout
    end
  end

  describe "interface" do
    it "collects the user input and carries out the actions" do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("1", "wrong", "2", "3", "9")
      expect { subject.interactive_menu }.to raise_error(SystemExit)
    end
  end

  describe "print_menu" do
    it "loads a CSV and removes a column and prints data" do
      allow($stdout).to receive(:write)
      expect { subject.ascii_render }.to output.to_stdout
    end
  end
end
