require 'takeaway_challenge'

describe Takeaway do

  describe "#list_dishes" do
    it 'shows a list of dishes with prices' do
      menu = "Ramen: £5.60, Chicken: £4.20, Salad: £3.99"
      expect(subject.list_dishes).to eq(menu)
    end
  end

end