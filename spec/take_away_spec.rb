# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'take_away'
describe TakeAway do
  describe "#show_dishes" do 
    it "shows a list of dishes with prices" do
      expect(subject.show_dishes).to eq ( { :pizza => 6, :burger => 5, :chicken => 4, :chips => 3 } )
    end
  end

  describe "#order" do
  let(:order) { { :chicken => 2, :chips => 1 } }
    it "selects some number of several available dishes" do
      expect(subject.order(order)).to eq [order]
    end
  end
end