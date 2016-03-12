require 'order'

describe Order do
  subject(:order){described_class.new(menu)}
  let(:menu){double :menu, all_dishes: [dish]}
  let(:dish){double :dish, name: "dish", price: 10}
  let(:dish){double :dish, name: "dih", price: 10}

  it "should initialize with a menu as an argument" do
    expect(order.menu).to eq menu
  end

  describe "#add_dish" do
    it "should add the selected dish to the items array" do
      order.add_dish("dish",2)
      expect(order.items).to eq [dish, dish]
    end
  end

  describe "#place_order" do
    it "should return name and quantity of each item in order and total sum" do
      order.add_dish("dish",2)
      order.add_dish("dih", 2)
      expect(order.place_order(40)).to eq "dish - 2, dih - 2, Total : 20"
    end
  end



end
