require 'printer'

describe Printer do

  subject(:printer){ described_class.new }
  let (:menu){double :menu}

  describe "#print" do

    it "should respond to print" do
        expect(printer).to respond_to(:print).with(1).argument
    end
  end
end
