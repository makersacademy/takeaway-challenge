require "./lib/menu.rb"

RSpec.describe Menu do
let(:burgers) { Menu::BURGERS }

    it "checks menu price is not nil" do
        expect(burgers).not_to have_value(nil)
    end

    it "checks menu price is not zero" do
        expect(burgers).not_to have_value(0)
    end 

    it "checks dish name is a symbol" do
        burgers.each do |k, _v|
          expect(k).to be_a(Symbol)
        end
    end

    it "checks menu is a hash" do
        expect((burgers).is_a?(Hash)).to be_truthy
    end

end
