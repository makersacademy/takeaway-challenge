require "order"

describe Order do

subject(:order) {described_class.new("Tim")}

it 'has a name upon inititialisation' do
  expect(order.name).to eq "Tim"
  end

  describe "#addto_order" do
    it "takes an argument and adds it to dish_list" do
    order.addto_order({"Tom Yum" => 7})
    expect(order.dish_list).to eq ([{"Tom Yum" => 7}])
    end
  end
end
