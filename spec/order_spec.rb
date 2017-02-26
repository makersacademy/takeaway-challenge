require 'order'
describe Order do
let(:order){described_class.new(menu)}
let(:menu){ double(:menu) }
let(:dishes) { {chicken: 3, pizza: 2, burger: 1} }
  before do
    allow(menu).to receive(:dish_available?).with(:chicken).and_return(true)
    allow(menu).to receive(:dish_available?).with(:pizza).and_return(true)
    allow(menu).to receive(:dish_available?).with(:burger).and_return(true)

  end


  context 'oder attributes' do
     it 'allow to place an order for several dishes' do
       order.place_order(:chicken, 1)
       order.place_order(:chicken, 1)
       order.place_order(:chicken, 1)
       order.place_order(:pizza, 1)
       order.place_order(:pizza, 1)
       order.place_order(:burger, 1)
       expect(order.dishes).to eq dishes
     end
     it "doesn't allow to place an item if its not on menu" do
       allow(menu).to receive(:dish_available?).with(:chees_burger).and_return(false)
       error = "the requested item is not on the menu"
       expect{order.place_order(:chees_burger, 1)}.to raise_error error
     end
  end


end # => order describe
