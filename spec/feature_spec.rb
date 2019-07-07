require './lib/restaurant.rb'
require './lib/takeaway-app.rb'
require './lib/message-service.rb'


describe "Takeaway_application features" do

  let(:restaurant) { Restaurant.new }
  let(:takeawayapp) { TakeawayApp.new(restaurant, message_service) }
  let(:message_service) { double 'message_service', message_manager: 'Text message sent' }

  scenario "a user selects food to order" do
    selection, qty, total = 'Margarita', 1, 10
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Pepperoni', 2, 24
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Vegetarian', 3, 33
    takeawayapp.menu(selection, qty, total)
    expect(takeawayapp.menu_selection).to eq([['Margarita', 1, 10], ['Pepperoni', 2, 24], ['Vegetarian', 3, 33]])
  end


  scenario "a user orders food & totals match" do
      selection, qty, total = 'Margarita', 1, 10
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Pepperoni', 2, 24
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Vegetarian', 3, 33
      takeawayapp.menu(selection, qty, total)
      expect(takeawayapp.order_confirmation).to eq(message_service.message_manager(takeawayapp.menu_selection, takeawayapp.total))
    end

    scenario "a user orders food & totals match" do
      selection, qty, total = 'New Yorker', 1, 14
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Texas BBQ', 2, 26
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Vegetarian', 1, 11
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Margarita', 6, 60
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Texas BBQ', 2, 26
      takeawayapp.menu(selection, qty, total)
      selection, qty, total = 'Deluxe', 1, 15
      takeawayapp.menu(selection, qty, total)
      expect(takeawayapp.order_confirmation).to eq(message_service.message_manager(takeawayapp.menu_selection, takeawayapp.total))
    end

  scenario "a user orders food but totals do not match" do
    selection, qty, total = 'Margarita', 1, 10
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Pepperoni', 2, 24
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Vegetarian', 3, 7
    takeawayapp.menu(selection, qty, total)
    expect { takeawayapp.order_confirmation }.to raise_error("Totals do not match, please check your order")
  end

  scenario "a user orders food but totals do not match" do
    selection, qty, total = 'New Yorker', 1, 14
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Texas BBQ', 2, 26
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Vegetarian', 1, 11
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Margarita', 6, 60
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Texas BBQ', 2, 26
    takeawayapp.menu(selection, qty, total)
    selection, qty, total = 'Deluxe', 1, 14
    takeawayapp.menu(selection, qty, total)
    expect { takeawayapp.order_confirmation }.to raise_error("Totals do not match, please check your order")
  end
end
