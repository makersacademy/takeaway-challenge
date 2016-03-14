require 'my_order'



describe 'Feature Spec' do
menu = Menu.new
my_order1 = MyOrder.new(menu)
my_order2 = MyOrder.new(menu)
my_order3 = MyOrder.new(menu)
my_order4 = MyOrder.new(menu)
my_order5 = MyOrder.new(menu)

before(:each) do

  menu.add_dish("Chicken Curry", 12.30)
  menu.add_dish("Fish Curry", 11.30)
  menu.add_dish("Lamb Curry", 13.30)
  menu.add_dish("Fries", 2.30)
  menu.add_dish("Salad", 7.30)
  menu.add_dish("Naan", 3.30)
  menu.add_dish("Pilau Rice", 1.30)
  menu.add_dish("Plain Rice", 0.30)
  menu.add_dish("Poppadom", 0.30)


end

  it 'USER STORY 1 - see a list of dishes with prices' do
    my_order1.pick("Chicken Curry", 4)
    expect(my_order1.menu.show_menu).to be_a String
  end

  it 'USER STORY 2.1 - select some number of several available dishes (Quant)' do
    my_order2.pick("Chicken Curry", 4)
    expect(my_order2.picks[0][1]).to eq 4
  end

  it 'USER STORY 2.2 - select some number of several available dishes (Name)' do
    my_order3.pick("Chicken Curry", 4)
    expect(my_order3.picks[0][0].name).to eq "Chicken Curry"
  end

  it 'USER STORY 3.1 - check total' do
    my_order4.pick("Chicken Curry", 4)
    expect(my_order4.total).to eq 49.20
  end

  it 'USER STORY 3.2 - shows full receipt at checkout' do
    my_order5.pick("Chicken Curry", 4)
    expect(my_order5.check_out).to be_a String
  end

end
