require "restaurant"

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe "#food" do
    it "a hash of all the food" do
      expect( subject.food).to eq( {:"RUSTICA MARGHERITA"=>9.45, :"LENTIL RAGU"=>8.95, :"GREEN GODDESS BROCCOLI SALAD"=>10.95, :"SPAGHETTI POMODORO"=>7.95} )
    end
  end

  describe "#menu" do
    it "allows a view of the menu" do
      expect{ subject.menu }.to output(include("RUSTICA MARGHERITA : £9.45")).to_stdout
    end
  end
end
