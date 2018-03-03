require 'menu'

describe Menu do

  subject(:menu)  { described_class.new(dbl_dish_class) }
  let(:dbl_dish_class) { double :Dish, new: dish }
  let(:dbl_dish) { double :dish, name: samosa, price: 1.0 }

  context 'adding and displaying dishes' do
    subject.add_dish('fake name', 1.0)
    expect(subject.display(false)).to eq "1. Samosa, £1.0\n"
  end

  context 'selecting and returning dishes' do
    subject.add_dish('fake name', 1.0)
    expect(subject.select(1,2)).to eq [dbl_dish, dbl_dish]
  end
end
