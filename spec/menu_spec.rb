require 'menu'

describe Menu do

  let(:p_pizza) { double(:dish, name: "Pepperoni Pizza", price: 9.50) }
  let(:m_pizza) { double(:dish, name: "Margherita Pizza", price: 7.50) }
  let(:c_pizza) { double(:dish, name: "Chicken Pizza", price: 10.50) }
  subject(:menu) { described_class.new(p_pizza, m_pizza) }

  describe "#dishes" do
    it "should return an array of dishes" do
      expect(subject.dishes).to eq [p_pizza, m_pizza]
    end
  end

  describe "#new_dish" do
    it "allows for new dishes to be added" do
      subject.new_dish(c_pizza)
      expect(subject.dishes).to eq [p_pizza, m_pizza, c_pizza]
    end
  end

  describe "#list" do
    it "should return a string of all available dishes and prices" do
      expect(subject.list).to eq "Pepperoni Pizza - £9.50, Margherita Pizza - £7.50"
    end
  end
end
