require 'menu'

RSpec.describe Menu do

  context "#menu" do
    let(:pizza) { described_class.new("Pizza", 10.50)}
    it "should print a menu in an hash" do
      expect(subject.menu_list).to be_kind_of Array
    end
  end
  context "#to_string" do
    it "should return a string of menu" do
      p subject.add("Burger", 6.50)
      expect(subject.to_string).to eq "Burger at £6.50"
    end
  end
end
