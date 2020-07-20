require 'menu'
describe Menu do
  subject(:menu) {described_class.new(dishes) }

  let(:dishes) do
      {
        avocado: 4.99,
        falafel: 3.99,
        beans: 3.99,
        lentils: 3.99,
}
end
it "has a list of dishes with the prices" do
    expect(menu.dishes).to eq(dishes)
  end
  it "prints a list of dishes with prices" do
    printed_menu = "Avocado £4.99, Falafel £3.99, Beans £3.99, Lentils £3.99"
    expect(menu.print).to eq(printed_menu)
  end
end
