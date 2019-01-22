require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) } 

  let (:dishes) do
    { "Hoummos" => "4.50", "Tabbouleh" => "4.50" }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end 
end
