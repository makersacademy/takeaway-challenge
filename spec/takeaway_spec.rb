require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { Menu::DEFAULT_MENU }

  it 'has a list of dishes and prices' do
    expect(menu.dishes_list).to eq dishes
  end
  it 'prints a menu' do
    menu_list = "Llomo_saltado £14.99, Ratatouille £9.00, Chicken_and_chips £5.50, Ceviche £10.00"
    expect(menu.print_menu).to eq menu_list
  end
  it 'verifies if a dish is on the menu' do
    expect(menu.includes?(:ceviche)).to be true 
  end
end

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  let(:dishes) do {
    llomo_saltado: 2,
    ceviche: 1
   } 
  end
  it 'orders several dishes from the menu' do
    order.place_order(:llomo_saltado, 2)
    order.place_order(:ceviche, 1)
    expect(order.dishes_ordered).to eq dishes
  end

  it 'raises an error if ordering something not from the menu' do
    error = "#{dish} doesn't exist on the menu"
    expect { order.place_order(dish, quantity) }.to raise_error OrderError, error
  end
end
