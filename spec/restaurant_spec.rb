require "restaurant"

describe Restaurant do

  let (:menu) { double(:menu, dishes: { rice: 10.99, pizza: 5.99 } ) }
  let (:messenger) { double(:messenger, send_message: :message_sent)}
  let (:menu_class) { double(:menu_class, :new => menu) }
  let (:messenger_class) { double(:messenger_class, :new => messenger) }
  let (:order) { double(:order, ordered_items: { rice: 1, pizza: 1 }, total: 16.98 ) }
  let (:incorrect_order) { double(:order, ordered_items: { rice: 1, pizza: 1 }, total: 10.98 ) }
  let (:off_menu_order) { double(:order, ordered_items: { rice: 1, pizza: 1, poison: 10 }, total: 16.98 ) }
  let (:non_order) { double(:order, ordered_items: { rice: 0 }, total: 0 ) }

  it "can have menu on initialize" do
    restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 }, messenger: messenger_class } )
    expect(restaurant.current_menu).to eq(menu)
  end

  describe "#place_order" do

    it "checks order total is correct" do
      restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 }, messenger: messenger_class } )
      expect{ restaurant.place_order(incorrect_order) }.to raise_error "incorrect order"
    end

    it "ignore non menu items" do
      restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 }, messenger: messenger_class } )
      expect(messenger_class).to receive(:send_message).with(off_menu_order)
      restaurant.place_order(off_menu_order)
    end

    it "error if nothing ordered" do
      restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 }, messenger: messenger_class } )
      expect{restaurant.place_order(non_order)}.to raise_error "incorrect order"
    end

    it "confirms order if correct" do
      restaurant = described_class.new( { menu: menu_class, dishes: { rice: 10.99, pizza: 5.99 }, messenger: messenger_class } )
      expect(messenger_class).to receive(:send_message).with(order)
      restaurant.place_order(order)
    end
  end
end


