require_relative '../lib/Menu'

describe Menu do

  subject(:menu) { Menu.new }
  let(:dishes) do
    {
      "spring roll"=>0.99,
        "char sui bun"=>3.99,
        "pork dumpling"=>2.99,
        "peking duck"=>7.99,
        "fu-king fried rice"=>5.99
      }
  end
  it "has a list of dishes with prices" do
    double = dishes
    double.each do |dish, price|
      string = "#{dish}\n £#{price}"
    end
    double1 = double
    expect(menu.print).to eq(double1)
  end

end
