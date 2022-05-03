require 'menu'

describe Menu do
  describe "#dishes" do
    it "contains a list of the dishes with prices" do
      menu = {
        "meatball sub" => 5,
        "steak n cheese sub" => 6,
        "low cal turkey sub" => 4
      }
      expect(subject.dishes).to eq menu
    end
  end

end
