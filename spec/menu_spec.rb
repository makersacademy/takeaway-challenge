require 'menu'

describe Menu do

  it "should have a list of dishes" do
    expect { (subject.items).to_not be_empty }
  end

  context "#read_menu" do
    it "should print out menu" do
      expect(subject.read_menu).to include("Hamburger")
    end
  end
end
