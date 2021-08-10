require "takeaway"
require "menu"
require "order"


describe Takeaway do
  describe "#menu" do
    it "initializes with a new instance of the menu class" do
      expect(subject.menu.dish_list).to be_instance_of(Array)
    end  
  end

  describe "#view_menu" do
    it "displays the menu in a user-friendly format" do
      expect(subject.view_menu).to eql "** Margarita - £5 ** Veggie - £6 ** Hawaiian - £7 ** Pepperoni - £8 ** Calzone - £9 **" 
      # "£5 - Margarita\n£6 - Veggie\n£7 - Hawaiian\n£8 - Pepperoni\n£9 - Calzone\n"
    end   
  end
end  