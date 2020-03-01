require "takeaway"

describe TakeAway do
  describe "#print_menu" do
    it "shows the menu with dishes and prices" do
      expect(subject.print_menu).to eq({ "Fish & chips"=>7.95, "Mac 'n' cheese and chips"=>6.95, "Mushroom pie and chips"=>7.95, "Beetroot and quinoa burger"=>8.50, "Cauliflower and cheese"=>9.30})
    end
  end

end
