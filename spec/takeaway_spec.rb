require 'takeaway'
describe Takeaway do

  describe "#print_menu" do


    it "shows the menu with dishes and prices" do
      menu_double = double :menu
      menu_class_double = double :menu_class, new: menu_double
      takeaway = Takeaway.new(menu_class_double)

    expect(menu_double).to receive(:print)
    takeaway.print_menu

    end
  end
   
end
