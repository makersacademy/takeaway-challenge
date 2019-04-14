require 'menu'

describe Menu do

  describe "#menu" do
    it "should return an array of menu item hashes" do
      expect(subject.menu).to be_an_instance_of(Array)
    end
  end

  describe "#print_menu" do
    it "prints the menu to the console" do
      expect(subject.print_menu).to eq(subject.menu)
    end
  end

end
