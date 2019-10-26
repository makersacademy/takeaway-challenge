require 'display'

describe Display do
  let(:display) {Display.new}
  let(:restaurant_double) {double :restaurant_double}

  context "#menu" do

    it "it returns a string" do
      expect(display.menu(restaurant_double)).to be_a(String)
    end
  end

end
