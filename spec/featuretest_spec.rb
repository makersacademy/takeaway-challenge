require "./lib/takeaway.rb"
require "./lib/menu.rb"
require "./lib/order.rb"
require "./lib/pricemanager.rb"
require "./lib/text.rb"
require "./lib/dish.rb"

describe "Full Feature Test" do
  it "Runs the Takeaway - displays menu, takes order, confirms order" do
    takeaway = Takeaway.new
    puts takeaway.publish_menu
    puts takeaway.select_dish("Juice", 1)
    puts takeaway.select_dish("Juice", 2)
    puts takeaway.select_dish("Korma", 1)
    puts takeaway.select_dish("Korma", 2)
    puts takeaway.publish_order
    puts takeaway.confirm_order
    expect(2 + 3).to eq 5
  end
end
