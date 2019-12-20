require 'order'

describe Order do
  let(:menu) { double :menu, list: "juice - £1.00" }
  let(:menu_class) { double :menu_class, new: menu }
  let(:order) { Order.new(menu_class) }
  before { allow(menu).to receive(:get_price).with(:juice).and_return(1) }

  it 'can see items from Menu class' do
    expect(order.see_menu).to eq("juice - £1.00")
  end

  it 'allows user to select dishes' do
    order.choose_item(:juice)
    expect(order.choice).to include(:juice => 1)
  end

  it 'allows to choose multiples of same item' do
    order.choose_item(:juice, 2)
    expect(order.choice.count).to eq 2
  end

  it 'calculates total cost of selected dishes' do
    order.choose_item(:juice)
    expect(order.total_price).to eq 1
  end

  it 'prints receipt of order' do
    order.choose_item(:juice)
    order.total_price
    expect { order.print_receipt }.to output("juice - £1.00\nTotal to pay: £1.00\n").to_stdout
  end

end
