require 'menu'
describe Menu do
  let(:dish) { double("Dishes") }
  describe "#add_to_menu" do
    it "should add an object to the menu and increase the length of the array" do
      expect { subject.add_to_menu(dish) }.to change { subject.dishes.length }.by 1
    end
  end
  describe "#show_menu" do

  end
end
