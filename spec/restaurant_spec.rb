require "restaurant"

describe Restaurant do

  let (:menu) { double(:menu, dishes: { rice: 10.99, pizza: 5.99 } ) }
  let(:menu_class) { double(:menu_class, :new => menu) }
  let (:incorrect_order) { double(:order, ordered_items: { rice: 1, pizza: 1 }, total: 10.98 ) }


  it "can have menu on initialize" do
    restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 } } )
    expect(restaurant.current_menu).to eq(menu)
  end



  it "checks order total is correct" do
    expect{ subject.check_order(incorrect_order) }.to raise_error "total incorrect"
  end
end


