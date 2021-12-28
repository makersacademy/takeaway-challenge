require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { Menu.new({Soup: 2, Bread: 1}) }

  describe "#display_menu" do
    it "displays the menu" do
      expect{takeaway.display_menu}.to output("Soup ~ £2.00 | Bread ~ £1.00\n").to_stdout
    end
  end
end


