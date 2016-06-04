require 'menu'

describe Menu do
 subject(:menu) {described_class.new}

 it "should have a menu for the takeway" do
 	expect(menu.display). to eq ({"margarita": 5, "mushroom_pizza": 6, "pepperoni_pizza": 7, "chips": 3, "soft_drink": 2, "alcohol": 5}
)
 end


end
