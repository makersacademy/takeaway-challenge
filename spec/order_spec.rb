require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:menu) {instance_double("Menu")}
  let(:dishes) {
    {
      "Prawn Toast": 2,
      "Siu Mai": 1
    }}

  before do
    allow(menu).to receive(:has_dish?).with(:"Prawn Toast").and_return(true)
    allow(menu).to receive(:has_dish?).with(:"Siu Mai").and_return(true)
    allow(menu).to receive(:price).with(:"Prawn Toast").and_return(5.50)
    allow(menu).to receive(:price).with(:"Siu Mai").and_return(4.00)
  end

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:"Onion Bhaji").and_return(false)
    expect { order.add(:"Onion Bhaji", 2) }.to raise_error NoItemError, "Onion bhaji is not on the menu!"
  end

  it "calculates the total of the order" do
    
    total = 15.00
    expect(order.total).to eq(total)
  end



  def create_order
    order.add(:"Prawn Toast", 2)
    order.add(:"Siu Mai", 1)
  end
end

