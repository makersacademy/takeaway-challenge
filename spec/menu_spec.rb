require_relative "../lib/menu.rb"

RSpec.describe Menu do
  describe "#check_menu" do
    it "returns a hash with list of dishes & prices" do
      expect(subject.check_menu).to eq subject.menu
    end
  end
end
