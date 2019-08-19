require 'menu'
describe Menu do

it 'can create a new menu with list of dishes' do
menu = Menu.new
expect(menu).to be_a_kind_of(Menu)
end

it 'can list all the dishes in the menu with prices' do
expect(subject.dishes).to eq([{dish: "Teriyaki", price: 4.50},{dish: "Pho", price: 6.00},{dish: "Sushi", price: 7.00},{dish: "pizza", price: 7.50}])
end

end
