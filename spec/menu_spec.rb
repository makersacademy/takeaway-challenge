require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'is created with a list of dishes and prices' do
    expect(subject.dishes).to eq([{ :dish => "Chicken", :price => "£3.50" }, { :dish => "Pizza", :price => "£4" }])
  end

  it 'prints a list of dishes and prices' do
    expect(subject.print_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

  it 'lets me select a certain number of 1 dish at a time' do
    expect(subject.select_dishes("Chicken", 2)).to eq(["Chicken, 2"])
  end

  it 'lets me select any number of available dishes' do
    subject.select_dishes("Chicken", 2)
    subject.select_dishes("Pizza", 1)
    expect(subject.add(menu.selection).to eq(["Chicken, 2"])
  end
end
