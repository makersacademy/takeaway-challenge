require 'dish'
require 'menu'

describe Dish do

  subject(:dish) {described_class.new(3, menu)}
  let(:menu) { double(:menu) }

  before :each do
    allow(menu).to receive(:list).and_return([{:number => 3, :name => "Margherita", :price => 8.95}])
  end

  describe "#get_details" do
    it "gets the correct details" do
      expect(dish.get_details(3, menu)).to eq({:number => 3, :name => "Margherita", :price => 8.95})
    end
  end

end
