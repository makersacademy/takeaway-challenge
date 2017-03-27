require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {double(:dish)}

  it 'has an array of dishes' do
    menu.dishes << dish
    expect(menu.dishes).to include(dish)
  end

  it 'lets user add new item to menu' do
    menu.add_item("Soup", 4)
    expect(menu.dishes[-1].name).to eq("Soup")
  end 


end
