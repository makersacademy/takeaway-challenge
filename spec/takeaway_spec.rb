require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}



  describe "#print_menu" do
    it "prints the menu" do
      expect(takeaway.print_menu).to eq(menu.dishes_list)
    end
  end

  describe "#order" do
    it "respondes to the order method"do
      expect(takeaway).to respond_to(:order)
    end
  end

end
