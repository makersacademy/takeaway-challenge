require 'dishes'

describe Dishes do
  # let (:menu){ "'Once in a lifetime Pizza' => 9.99" }
  subject(:dishes) { described_class.new }

  it "can create menu" do
    expect(dishes).to be_kind_of(Dishes)
  end

  describe "#show_dishes" do
    it "prints a list of dishes with prices" do
      expect { dishes.show_dishes }.to output(<<~output
          Diet (not really) Pizza £5.99
          Make me fat Pizza £6.99
          Easy-Peasy Pizza £7.99
          Hold my beer Pizza £8.99
          Once in a lifetime Pizza £9.99
        output
      ).to_stdout
    end
  end

  describe "#dishes_available?" do
    it "returns true when dishes available" do
      expect(subject.dish_available?).to eq(true)
    end
  end
end
