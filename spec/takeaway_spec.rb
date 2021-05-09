require 'takeaway'

describe TakeAway do

    describe "#menu" do 
      it "shows a menu of dishes and prices" do
      menu = TakeAway::MENU
      expect(subject.menu).to eq menu
    end
  end
end

