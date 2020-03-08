require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      pizza: 2,
      soda: 1
    }
  end

  before do 
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:soda).and_return(true)

    allow(menu).to receive(:price).with(:pizza).and_return(3.00)
    allow(menu).to receive(:price).with(:soda).and_return(2.50)
  end

  it "selects several dishes from the menu " do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "Doesn't allow items to be added that aren't on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
                                  #This refers to the class on the order.rb which will raise an error if item isnt on menu
  end

  it "calculates the total for the order" do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:pizza, 2)
    order.add(:soda, 1)
  end
  
end