require 'menu.rb'

describe Menu do

    subject(:menu) { described_class.new } 

    it 'it has a list of dishes with prices' do
        expect(menu.dishes.is_a?(Hash)).to be_truthy
    end

    it "calculates a price" do
        expect(menu.price("Dripping chips")).to eq(menu.dishes["Dripping chips"])
      end

   

end