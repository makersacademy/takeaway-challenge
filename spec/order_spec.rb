require 'order'

describe Order do

  let(:dishes) { { "Eggs" => 3, "Sausages" => 4 } }
  let(:restaurant) { double :restaurant, list_dishes: dishes }
  subject(:order) { described_class.new(restaurant) }

  it 'can give us a menu of dishes with prices' do
    expect(subject.list_dishes).to eq dishes
  end

  describe "#add_to_order" do
    it "can add a dish to the order" do
      expect(restaurant).to receive(:dish).with("Eggs")
      subject.add_to_order("Eggs")
    end

    it "can add a dish multiple times" do
      expect(restaurant).to receive(:dish).with("Eggs").exactly(5).times
      subject.add_to_order("Eggs",5)
    end
  end

end
