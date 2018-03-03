require 'menu'

describe Menu do

  subject(:menu)  { described_class.new(dbl_dish_class) }
  let(:dbl_dish_class) { double :Dish, new: dbl_dish }
  let(:dbl_dish) { double :dish, print: 'Samosa, £1.0' }

  it 'adds and displays dishes' do
    menu.add_dish('fake name', 1.0)
    expect(menu.print(false)).to eq "1. Samosa, £1.0\n"
  end

  it 'selects and returns dishes' do
    menu.add_dish('fake name', 1.0)
    expect(subject.select(1,2)).to eq [dbl_dish, dbl_dish]
  end
end
