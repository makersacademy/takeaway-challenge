require './lib/restaurant.rb'

describe Restaurant do

  let(:menu) {Menu.new}
  subject(:subject) {Restaurant.new(menu)}

  describe "#initialization" do

    it "is initialized with a default menu" do
      expect(subject.menu).to eq menu
    end
  end
end
