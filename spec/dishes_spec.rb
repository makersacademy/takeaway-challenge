require 'dishes'

describe Dishes do
  # subject(:dishes) { described_class.new }

  it "creates an instance of the class" do
    expect(subject).to be_instance_of(Dishes)
  end

  describe "#show_dishes" do
    it "prints a list of dishes with prices" do
      expect { subject.show_dishes }.to output(<<~output
          1. Diet (not really) Pizza £5.99
          2. Make me fat Pizza £6.99
          3. Easy-Peasy Pizza £7.99
          4. Hold my beer Pizza £8.99
          5. Once in a lifetime Pizza £9.99
        output
      ).to_stdout
    end
  end

  describe "#dishes_available?" do
    it "returns true when dishes available" do
      expect(subject.dish_available?(1)).to eq(true)
    end

    it "returns true when dishes available" do
      expect(subject.dish_available?(10)).to eq(false)
    end
  end
end
