require 'restaurant'

describe Restaurant do
  let(:menu) { double(:menu) }

  describe '#initialize' do
    subject(:restaurant_class) { described_class }
    it "is initialized with 1 argument" do
      expect(restaurant_class.new(menu)).to be_a restaurant_class
    end
    it "raises an argument error if no argument is given" do
      expect{ restaurant_class.new }.to raise_error(ArgumentError)
    end
  end
end
