require 'menu'
 
describe Menu do

let(:menu) {described_class.new}
let(:food) { double :food}
let(:price) { double :price}

    it 'will check that menu contains a food and price'do
        menu.add_food(food, price)
        expect(menu.view_menu).to eq({food => price})
    end

end