require './lib/takeaway-app.rb'

describe TakeawayApp do
  subject(:takeawayapp) { described_class.new(restaurant, message_service) }
  
  let(:message_service) { double 'message_service' }
  let(:restaurant) { double 'restaurant', menu:  [
    {food: 'Margarita', price: 10 },
    { food: 'Pepperoni', price: 12 },
    { food: 'Hawaiian', price: 12 },
    { food: 'Vegetarian', price: 11 },
    { food: 'BBQ Chicken', price: 13 },
    { food: 'Meaty', price: 14 },
    { food: 'Deluxe', price: 15 },
    { food: 'Veggie Volcano', price: 12 },
    { food: 'Ranch BBQ', price: 12 },
    { food: 'New Yorker', price: 14 },
    { food: 'Tandoori', price: 12 },
    { food: 'Texas BBQ', price: 13 }
  ] }

  describe "#menu" do
    context "when 3 diff pizzas are selected" do
      it "shovels the input into the menu_selection array" do
        selection, qty, total = 'Margarita', 1, 10
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Pepperoni', 2, 24
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Vegetarian', 3, 33
        takeawayapp.menu(selection, qty, total)
        expect(takeawayapp.menu_selection).to eq [['Margarita', 1, 10], ['Pepperoni', 2, 24], ['Vegetarian', 3, 33]]
      end
    end

    context "when 6 diff pizzas are selected" do
      it "shovels the input into the menu_selection array" do
        selection, qty, total = 'New Yorker', 1, 14
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Texas BBQ', 2, 26
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Vegetarian', 1, 11
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Margarita', 6, 60
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Pepperoni', 1, 12
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Tandoori', 1, 12
        takeawayapp.menu(selection, qty, total)
        expect(takeawayapp.menu_selection).to eq [['New Yorker', 1, 14], ['Texas BBQ', 2, 26], ['Vegetarian', 1, 11], ['Margarita', 6, 60], ['Pepperoni', 1, 12], ['Tandoori', 1, 12]]
      end
    end
  end

  describe "#order_confirmation" do
    context " when the order & restaurant totals match" do
      it "message_service.message_manager is called" do
        expect(message_service).to receive(:message_manager).with(takeawayapp.menu_selection, 67)
        selection, qty, total = 'Margarita', 1, 10
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Pepperoni', 2, 24
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Vegetarian', 3, 33
        takeawayapp.menu(selection, qty, total)
        takeawayapp.order_confirmation
      end
    end

    context " when the order & restaurant totals do not match" do
      it "raises and error" do
        selection, qty, total = 'Margarita', 1, 10
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Pepperoni', 2, 24
        takeawayapp.menu(selection, qty, total)
        selection, qty, total = 'Vegetarian', 3, 7
        takeawayapp.menu(selection, qty, total)
        expect { takeawayapp.order_confirmation }.to raise_error("Totals do not match, please check your order")
      end
    end
  end
end
