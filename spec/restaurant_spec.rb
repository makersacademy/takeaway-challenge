require './lib/restaurant.rb'

describe Restaurant do

  let(:menu) {Menu.new}
  subject(:subject) {Restaurant.new(menu)}

  describe "#initialization" do

    it "is initialized with a default menu" do
      expect(subject.menu).to eq menu
    end
    it "has 5 dishes on default menu" do
      expect(subject.menu.dishes.length).to eq 5
    end
  end
end
