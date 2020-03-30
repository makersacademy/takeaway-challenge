require_relative '../lib/Menu'

describe Menu do
  subject(:menu) { Menu.new }
  let(:dishes) do
    {
      "fish"=> 5,
      "rice"=> 3,
      "peas" => 2,
      "mash" => 3,
      }
  end

  it "has a list of dishes with prices" do
    @dishes = dishes
    dishes.each do |dish, price|
      string = "#{dish}\n £#{price}"
    end
    expect(menu.print).to eq(dishes)
  end

end
