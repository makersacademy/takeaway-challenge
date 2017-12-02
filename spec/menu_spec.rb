require 'menu'

describe Menu do
  describe "#print_menu" do
    it "should print the list of menu items" do
      expect { subject.print_menu }.to output.to_stdout
    end
  end
  describe "#choose_item" do
    it "returns the selected menu item" do
      expect(subject.choose_item('Lunch')).to eq({:Lunch => 2})
    end
  end
end
