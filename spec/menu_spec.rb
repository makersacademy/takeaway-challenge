require 'menu'

describe Menu do

  subject(:menu) { described_class.new}

#   let(:dishes) do {
#     chicken: 3.50,
#     falafel: 4.50
#   }
# end

  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq([{ :dish => "Chicken", :price => "£3.50" }, { :dish => "Pizza", :price => "£4" }])
  end

  it 'prints a list of dishes and prices' do
    expect(subject.print_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

  # it 'tells if a dish is on the menu' do
  #   expect(menu.has_dish?("Chicken")).to be true
  # end

end
