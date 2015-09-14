require 'menu'
describe Menu do

    it "should have a hash of dishes and price" do
      expect(subject.dishes).to be_a Hash
    end

    it "can extract the price of a dish" do
      expect(subject.price_list["crispy chilli beef"]).to eq(5)
    end

end
