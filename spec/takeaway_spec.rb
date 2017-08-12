require './docs/takeaway.rb'

describe Takeaway do
  let(:menu) { double "menu" }

  context "#show_menu" do
    it "displays the food menu" do
      expect(subject.show_menu).to respond_to(:display)
    end
  end
end
