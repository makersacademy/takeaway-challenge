require 'menu'

describe Menu do
subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      beef: 3,
      chicken: 2,
      cod: 5
    }
  end

  it "has a list of dishes with prices" do
    expect(subject.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "beef 3, chicken 2, cod 5"
    expect(menu.print).to eq(@dishes)
  end

end
