require "menu"

describe Menu do
  subject(:menu) { described_class.new }

  describe "#view" do
    it "allows a view of the current menu" do
      expect(menu.view).to eq( {1=>["RUSTICA MARGHERITA", 9.45], 2=>["LENTIL RAGU", 8.95], 3=>["GREEN GODDESS BROCCOLI SALAD", 10.95], 4=>["SPAGHETTI POMODORO", 7.95]} )
    end
  end
end
