require 'menu'

describe Menu do
  let(:menu) { { :margherita => 7.50, :pepperoni => 10.50, :calzone => 12.50, :diavola => 10.50 } }
  describe "#intialize" do
    it "initializes with a hash containing all menu items and prices" do
      expect(subject.menu).to eq menu
    end
  end
end

# To do - code in an #add method to enable menu to be built from scratch
  # describe "#add" do
  #   it "adds a menu item and corresponding price to the #menu" do
  #     expect(subject.add)
  #   end
  # end
