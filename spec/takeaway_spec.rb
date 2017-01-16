require 'takeaway'
describe Takeaway do
  #inject menu into takeaway and delegate print method to menu
  subject(:takeaway) { described_class.new(menu: menu)}
  let(:menu) { double(:menu, print: printed_menu)}
  let(:printed_menu) {'eggs £4,000' }

  #let(:menu) { double(:menu) }
    it "show the menu with all the dishes and their prices" do
      expect(takeaway.print_menu).to eq(printed_menu) #gonna stub this, just some dummy text for the moment
    end


end

#takeaway doesn't really need to know about menu
