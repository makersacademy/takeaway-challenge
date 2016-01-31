require './lib/take_away.rb'

describe TakeAway do
  subject(:take_away) { described_class.new }

  describe "#show_menu" do

    it "returns a menu" do
      expect { take_away.show_menu }.to output(
                       /MENU/
      ).to_stdout
    end
  end

  describe "#enter_order" do

    before(:example) do
      io_obj = double("input")
      allow(take_away).to receive(:gets).and_return(io_obj).at_least(3).times
      expect(io_obj).to receive(:chomp).and_return(5, 2, 99,)
    end

    it "gives information" do
      expect { take_away.enter_order }.to output(
               /dish number/
      ).to_stdout
    end

    it "accepts input from user" do
      expect { take_away.enter_order }.to output(
               /quantity/
      ).to_stdout
    end

    it "add ordered items to order hash" do
      expect { take_away.enter_order }.to output().to_stdout
      expect(take_away.order[5]).to eq 2
    end
  end

  describe "#calculate_order" do

    it "asks for an estimated total" do
      io_obj = double("input")
      allow(take_away).to receive(:gets).and_return(io_obj)
      expect(io_obj).to receive(:chomp).and_return(100)
      expect { take_away.calculate_order }.to output(
               /total/
      ).to_stdout
    end
  end
end
