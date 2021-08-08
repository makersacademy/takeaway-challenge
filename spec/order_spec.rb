require './lib/order'

describe Order do
  let(:menu) { [
    {"soup" => 3},
    {"bread" => 2},
    {"pizza" => 10},
    {"fish" => 16},
    {"chips" => 3},
    {"salad" => 3},
    {"ice cream" => 6}
  ] }
  subject(:order) { described_class.new(menu) }

  let (:user_input) { [
    "1\n",
    "3\n",
    "5\n",
    "confirm\n"
  ] }

  describe "#select_order" do
    
    it "takes order from user input" do 
      allow(order).to receive(:gets).and_return(*user_input)
      expect(order.select_order).to eq [{"soup"=>3}, {"pizza"=>10}, {"chips"=>3}]
    end

  end

  describe "#cost" do
    # need to add functionality to the menu instance variable so that its a dictionary that stores price of meal as well
    # maybe make an interface class as well that prints stuff? sends texts?

    it "returns total cost of items ordered" do
      allow(order).to receive(:gets).and_return(*user_input)
      order.select_order
      expect(order.cost).to eq 16
    end

  end



end