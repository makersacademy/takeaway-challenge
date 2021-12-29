require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { Menu.new({"Soup"=>2, "Bread"=>1}) }

  describe "#display_menu" do
    it "displays the menu" do
      expect{takeaway.display_menu}.to output("Soup ~ £2.00 | Bread ~ £1.00\n").to_stdout
    end
  end

  describe "#build_order" do
    it 'places an order' do
      expect(takeaway.build_order("Soup", 3)).to eq({"Soup"=>3})
    end
  end

  describe "display_order" do
    it "displays the current order" do
      
      output = "* 1 x Soup .. £2.00\n* 3 x Bread .. £3.00\n* Total ..... £5.00\n"

      takeaway.build_order("soup", 1)
      takeaway.build_order("bread", 3)
      expect{takeaway.display_order}.to output(output).to_stdout
    end
  end
end
