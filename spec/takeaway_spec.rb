require 'takeaway'

describe Takeaway do

  describe "read_menu" do
    it "shows a list of dishes with prices" do
      dishes = Takeaway.new
      expect(subject.read_menu).to eq(dishes.read_menu)
    end
  end

  it "should load menu" do
    subject.read_menu
    expect(subject.menu).to include("Tofish Bites": 6)
  end

end
