require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}  #this is like doing menu = Menu.new
  # but because menu has to be initialized with something, we do it like this?

let(:dishes) do
  {
    yummyfood1: 1,
    yummyfood2: 2

  }
end

  it "shows a list of dishes and prices on the menu" do
    expect(menu.dishes).to eq dishes
  end
end
