require 'menu'

describe Menu do
  let(:new_menu){described_class.new}
  let(:print_menu){"Burger, \u00A38\n Fries, "\
    "\u00A34\n Milkshake, \u00A34\n Doughnut, "\
    "\u00A32\n Cake, \u00A34\n Chickenbreast, "\
    "\u00A39\n Olive, \u00A32\n Cheese, "\
    "\u00A31\n Salad, \u00A36\n"}

  it "display the menu" do
    expect(new_menu.show).to eq (print_menu)
  end

  xit"add dish name and quantity into order_list" do
   #not tested this as it's linked with total_prince
  end

  it "return total price based on dishes and quantities from order_list" do
    new_menu.add_dish("Burger",1)
    new_menu.add_dish("Fries",1)
    price_should_be = 8*1+4*1
    expect(new_menu.total_price).to eq (price_should_be)
  end
end
