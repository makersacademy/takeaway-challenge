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

  describe "#create_dish_hash" do

    it "creates a hash with dish information" do
      take_away.create_dish_hash
      expect(take_away.dish_hash[5][1]).to eq 12.00
      expect(take_away.dish_hash[5][0]).to match /Peking/
    end

  end

  describe "#order_total" do

    xit "calculates an order total" do
      take_away.instance_variable_set(:@order, {5 => 2})
      expect(take_away.order_total).to eq 24.00
    end

  end
end
