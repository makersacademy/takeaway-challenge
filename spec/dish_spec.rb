require 'dish'
describe Dish do
  describe '#initialize' do
    subject(:dish_class) { described_class }
    it "is initialized with no arguments" do
      expect(dish_class.new).to be_a dish_class
    end
    it "errors if an argument is given" do
      expect{ dish_class.new :some_argument }.to raise_error(ArgumentError)
    end
  end
end
