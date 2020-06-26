require './lib/takeaway'
require './lib/order'

describe Takeaway do
  subject(:takeaway) {Takeaway.new(menu)}
  let(:menu) { double :'menu', display_menu: print }

  describe "takeaway creation" do
    it "checks for instance of takeaway" do
      expect(subject).to be_an_instance_of(Takeaway)
    end
  end
  describe "display_menu" do
    it "displays the menu" do
      expect(subject.display_menu).to eq menu
    end
  end
end