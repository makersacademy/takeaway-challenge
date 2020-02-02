require 'menu'
describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
  {
    a: 2.99,
    b: 3.50
  }
  end
  it "has a list of dishes with prices" do
    expect(subject.dishes).to eq(dishes)
  end
  it 'print a list of dishes' do
    printed_menu = "a, 2.99, b, 3.5"
    expect(menu.print).to eq(printed_menu)
  end
end

  