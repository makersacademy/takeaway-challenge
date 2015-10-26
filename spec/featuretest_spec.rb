require './lib/dish'
require './lib/menu'
require './lib/menufactory'
require './lib/orderfactory'
require './lib/order'
require './lib/invoice'
require './twilio'

describe "Feature Tests:" do
  context "when supplied with the following list" do
    let(:list) {
      list = [{name: :sushi, price: 5},
              {name: :burger, price: 3},
              {name: :noodles, price: 4}]
            }
    let(:menu)  {MenuFactory.build(list)}
    it "constructs a menu with dish objects" do
      expect(menu.dishes).not_to be_empty
    end

    context "when inspecting the dish objects" do
      it "should have a name" do
        expect(menu.dishes[1].name).to eq :burger
      end
      it "should have a price" do
        expect(menu.dishes[1].price).to eq 3
      end
    end

    context "when loading this menu on your order" do
      let(:order) {OrderFactory.load(menu)}
      before do
        order.choose_item(:sushi)
        order.choose_item(:noodles,2)
      end
      it "should allow you to choose items" do
        expect(order.current_order[0].name).to eq :sushi
      end
      it "should be able to take multiple orders" do
        expect(order.current_order[1]).to eq order.current_order[2]
      end
      it "can display the current total" do
        expect(order.order_total).to eq 13
      end
      context "confirming the order" do
        it "should create an invoice and confirm the order" do
          expect(order.confirm_order).to eq ({sushi: {quantity: 1, subtotal: 5}, noodles: {quantity: 2, subtotal: 8},total: 13})
        end
      end

    end
  end

end