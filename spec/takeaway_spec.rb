require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { Menu::MENU }

  it 'has a list of dishes and prices' do
    expect(menu.dishes_list).to eq dishes
  end
  
  it 'prints a menu' do
    menu_list = "Llomo_saltado £14.90, Ratatouille £9.00, Chicken_and_chips £5.50, Ceviche £10.00"
    expect(menu.print_menu).to eq menu_list
  end

  it { is_expected.to respond_to(:includes?).with(1).argument }

  it 'verifies if a dish is on the menu' do
    expect(menu.includes?(:ceviche)).to be true 
  end

  it 'set price of the dish' do
    expect(menu.price(:llomo_saltado)).to eq dishes[:llomo_saltado]
  end

  it 'shows the dishes name' do
    expect(menu.name(:llomo_saltado)).to eq :llomo_saltado
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
  before do
    allow(menu).to receive(:price).with(:llomo_saltado).and_return 14.90
    allow(menu).to receive(:price).with(:ceviche).and_return 10
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

  it 'set total' do
    order.place_order(:llomo_saltado, 2)
    order.place_order(:ceviche, 1)
    bill = 39.80
    expect(order.total_bill).to eq bill
  end

  it 'shows all dishes added' do
    order.place_order(:llomo_saltado, 2)
    order.place_order(:ceviche, 1)
    dishes = "Llomo Saltado, Ceviche"
    expect(order.check_dishes).to eq dishes
  end # incomplete
end
