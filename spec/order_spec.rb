require './lib/order'
require './lib/menu'
describe Order do
  let(:order) { Order.new(Menu.new) } #Contructor injection - A  type of dependancy injection

  it 'Adds items from the menu to the shopping cart' do
    order.add('Chicken Pie')
    expect(order.cart).to eq( [{'Chicken Pie' => 5}] )
  end

  it 'Adds multiple items to the cart' do
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.add('Liver Pie')
    expect(order.cart).to eq ( [{'Chicken Pie' => 5}, {'Chicken Pie' => 5}, {'Liver Pie' => 3 }]  )
  end

  it 'Can print an order summary with the correct price total' do
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.add('Liver Pie')
    order.add('Chicken and Leak')
    expect(order.total).to eq(19)
  end

  it 'Can print an order summary with the correct price total' do
    order.add('Chicken Pie')
    order.add('Chicken Pie')
    order.add('Chicken and Leak')
    expect(order.total).to eq(16)
  end
end
