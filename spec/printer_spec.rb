require "printer"

describe Printer do

  # let(:food_options) { double :food_options, :each => 1}

  describe "#format" do
    it "prints the menu" do
      expect { Printer.new.format([{ key: "Duck", value: "£12" }]) }.to output("Duck, £12\n").to_stdout
    end

  end

end
