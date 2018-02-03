require 'menu'

describe Menu do

  subject(:nice_menu) { described_class.new }

  describe "#initialize" do
    it "returns menu list" do
      expect(nice_menu.menu).not_to be_nil
    end
  end
  describe "print_menu" do
    it "returns each dish with price" do
      expect(subject.print_menu).to_not be_nil
    end
  end
end
