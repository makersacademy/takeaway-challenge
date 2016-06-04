require 'take_away'

describe TakeAway do
  subject(:take_away) { described_class.new }

  describe "#show_menu" do
    it "shows the menu" do
      expect(take_away).to respond_to :show_menu
    end
  end

  describe "#take_order" do
    it 'lets select a number of dishes for an order' do
      expect(take_away).to respond_to :take_order
    end
  end


end
