require 'takeaway.rb'
require 'menu.rb'

describe Takeaway do

  describe "menu" do
    it "returns a list of food with prices" do
      menu_test = Menu.new
      expect(subject.menu).to eq menu_test.dishes
    end
  end

end
