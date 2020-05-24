require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    { "Potato Wedges" => 2.50, "Fish&Chips" => 8.00, "Chicken Wings" => 5.99 }
  end
  
  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "read the list with dishes and prices" do
    expect(menu.read).to eq("Potato Wedges £2.50, Fish&Chips £8.00, Chicken Wings £5.99")
  end
    
end
