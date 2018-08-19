require 'takeaway'

describe Takeaway do


  describe "#view_menu" do
    it "shows a list of dishes with prices" do
      expect(subject).to respond_to(:view_menu)
    end

    

    it "shows a shows a list of dishes with prices" do
      expect(subject.view_menu).to eq({ "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 })
    end
  end



end
