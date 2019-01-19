require 'takeaway'

RSpec.describe Takeaway do

  context "#show_menu"
  let(:takeaway) { described_class.new}
    it "should print the menu" do
      subject.menu.add("Burger", 6.50)
      expect(subject.show_menu).to eq "Burger at £6.50\n"
    end
end
