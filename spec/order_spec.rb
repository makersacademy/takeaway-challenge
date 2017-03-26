require 'order'

describe Order do

subject(:order) { described_class.new }
let(:menu) { double :menu, :food_options => {"Corn on the Cob" => 1.50}}


  describe "#select_food" do
    it 'adds selected food to an array' do
      order.select_food("Corn on the Cob")
      expect(order.current_order[0]).to eq 'Corn on the Cob x1'
    end

    it 'can add multiple of each selected food' do
      order.select_food("Corn on the Cob", 5)
      expect(order.current_order[0]).to eq 'Corn on the Cob x5'
    end

    it "can't add a food that isn't on the menu" do
      expect(order.select_food("Pie", 1)).to raise_error "Sorry, Pie isn't on the menu!"
    end
  end
end
