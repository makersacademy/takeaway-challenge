require 'menu'

describe Menu do

subject(:menu) { described_class.new }
  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq([{:dish => "Chicken", :price => "£3.50"},
      {:dish => "Pizza", :price => "£4"}])
  end

  it 'prints a list of dishes and prices' do
    expect(subject.print_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

end
