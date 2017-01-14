require "dishes"

describe Dishes do
  subject(:dishes){ described_class.new }

  it {should respond_to(:all_dishes).with(0).argument}
  name = "test"
  price = 5

  describe "#add_dish" do
    it 'adss a dish to the available dishes array' do
      expect{subject.add_dish(name, price)}.to change{subject.all_dishes.length}.by 1
    end

  end

end
