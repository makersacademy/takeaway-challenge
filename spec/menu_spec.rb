require 'Menu'
describe Menu do
    it "responds to food_menu" do
        expect(subject).to respond_to(:food_menu)
    end

end