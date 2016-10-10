require 'order'

describe Order do
  subject(:order) {described_class.new}

  it "gets initialize as an empty array" do
    expect(order.order).to eq([])
  end

  it "has an initial total prize of 0" do
    expect(order.total_prize).to eq(0)
  end

  it "reports the total prize of the current order" do
    order.add_chicken
    order.check_order
    expect(order.order).to eq([{dish: "Chicken and rice", prize: 3.50},
    {total: "£3.5"}])
  end

  describe "#add_chicken" do
    it "adds the chicken dish to the order array" do
      order.add_chicken
      expect(order.order).to eq([{dish: "Chicken and rice", prize: 3.50}])
    end

    it "adds the prize of the chicken dish to the total prize" do
      expect{ order.add_chicken }.to change{ order.total_prize }.by 3.50
    end
  end

  describe "#add_lamb" do
    it "adds the lamb dish to the order array" do
      order.add_lamb
      expect(order.order).to eq([{dish: "Lamb and rice", prize: 4.0}])
    end

    it "adds the prize of the chicken dish to the total prize" do
      expect{ order.add_lamb }.to change{ order.total_prize }.by 4.0
    end
  end

  describe "#add_beef" do
    it "adds the lamb dish to the order array" do
      order.add_beef
      expect(order.order).to eq([{dish: "Beef and rice", prize: 4.50}])
    end

    it "adds the prize of the chicken dish to the total prize" do
      expect{ order.add_beef }.to change{ order.total_prize }.by 4.50
    end
  end

end
