describe 'User stories' do
  # *As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices*
  it 'so I can order something, see a list of dishes and prices' do
    menu = Menu.new
    expect { menu.show }.not_to raise_error
  end

  it 'should add a dish (including name and price) to the menu' do
    menu = Menu.new
    dish = Dish.new("Lasagna", 10)
    menu.add(dish)
    expect(menu.show).to eq([{ "Lasagna" => 10 }])
  end
end
