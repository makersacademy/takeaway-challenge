require 'order'

describe Order do

  subject(:order) { described_class.new(dbl_menu) }
  let(:dbl_dish) { double :dish,
    print: 'Samosa, £1.0',
    price: 1.0
  }
  let(:dbl_menu) { double :menu,
    select: dbl_dish,
    print: "1. Samosa, £1.0\n"
   }

  it 'lets you see the menu' do
    expect(order.show_menu(false)).to eq "1. Samosa, £1.0\n"
  end

  xit 'lets you add dishes to your order' do
    order.add_dish(1)
    expect(order.show_order(false)).to eq "Samosa £1.0\n"
  end

  # xit 'calculates the price' do
  #   order.add_dish(1)
  #   expect(menu.)
  # end

end
