require "./lib/restaurant"

describe Restaurant do

subject(:rest) { described_class.new }


it "has a menu" do

  expect(rest.respond_to?(:menu)).to eq true

end


it "displays a menu" do

  expect(rest.respond_to?(:display_menu)).to eq true

end

  describe "#order" do

it { is_expected.to respond_to(:order)}

#it { is_expected.to respond_to(:order).with(3).arguments}

end

end
