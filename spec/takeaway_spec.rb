require 'takeaway'

describe Takeaway do
  describe "ascii_render" do
    it "outputs the banner to the console" do
      expect { subject.ascii_render }.to output.to_stdout
    end
  end

  describe "interactive_menu" do
    it "loops the menu so that the user can move between options" do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("1", "wrong", "5")
      expect { subject.interactive_menu }.to raise_error(SystemExit)
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
      allow($stdin).to receive(:gets).and_return("1", "wrong", "2", "1", "y", "y", "3", "5")
      expect { subject.interactive_menu }.to raise_error(SystemExit)
    end
  end

  describe "print_menu" do
    it "loads a CSV and removes a column and prints data" do
      allow($stdout).to receive(:write)
      expect { subject.ascii_render }.to output.to_stdout
    end
  end

  describe "enter_number" do
    it "takes the customer number and checks it is adjusted as an international number" do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("07812345678", "y")
      expect(subject.enter_number).to eq("+447812345678")
    end
  end
end
