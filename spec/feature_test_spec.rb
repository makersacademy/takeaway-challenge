describe 'User Stories' do

let(:menu) { Menu.new }
let(:curry) { Dish.new("Vindaloo", 8)}
let(:pizza) {Dish.new("Pepperoni Pizza, 7")}
let(:kebab) {Dish.new("Doner Kebab, 8")}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows the user to see a list of dishes and their prices' do
    menu.add(curry)
    expect(menu.list).to include curry
  end




end
