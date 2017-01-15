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

it { is_expected.to respond_to(:order_items).with(2).arguments}

#it { is_expected.to respond_to(:order).with(3).arguments}

end

describe "confirm number of dishes" do
  it {is_expected.to respond_to(:finish_order)}
end

it "counts the number of dishes" do
  rest.order_items("chicken",2)
  rest.order_items("beef-stew",2)
  rest.finish_order(4)
  expect(rest.count).to eq(4)
end
it "raises an error if the total number of dishes given does not match the total order" do
  rest.order_items("chicken",2)
  rest.order_items("beef-stew",2)
  expect{rest.finish_order(5)}.to raise_error "the total given does not equal the dishes ordered"
end
#it 'should throw an error if exceeding maximum balance (90)' do
#      expect{subject.top_up(91)}.to raise_error "the maximum allowed balance is #{Oystercard::MAX_BALANCE} !"
#    end



end
