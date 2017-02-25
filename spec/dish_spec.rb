require 'dish'
require 'menu'

describe Dish do

  subject(:dish) {described_class.new(3, menu)}
  let(:menu) { double(:menu) }

  before :each do
    allow(menu).to receive(:list).and_return([{:number => 3, :name => "Margherita", :price => 8.95}])
  end

  describe "#get_price" do
    it "gets the correct price" do
      expect(dish.get_price(3, menu)).to eq 8.95
    end
  end

  describe "#get_details" do
    it "gets the correct details" do
      expect(dish.get_details(3, menu)).to eq({:number => 3, :name => "Margherita", :price => 8.95})
    end

  end


end
