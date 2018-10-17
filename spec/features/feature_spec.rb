require 'capybara'
require 'menu'
require 'order'
require 'text_confirm'

describe 'Feature Test', :type => :feature do

  scenario 'create a menu, order from it, and close the order' do
    given_a_list_of_dishes
    create_a_menu
    create_a_new_order_from_that_menu
    display_the_menu
    add_items_to_order_from_the_menu
    display_current_order_items
    attempt_to_close_order_with_wrong_total_should_result_in_error
    closing_order_with_right_total_user_should_receive_sms
  end

  def given_a_list_of_dishes
    @items = {
      "Tea" => 1.5,
      "Coffee" => 2.5
    }
  end

  def create_a_menu
    @menu = Menu.new(@items)
  end

  def create_a_new_order_from_that_menu
    @order = Order.new(@menu)
  end

  def display_the_menu
    @order.display_menu
  end

  def add_items_to_order_from_the_menu
    @order.add("Tea", 2)
    @order.add("Coffee", 2)
  end

  def display_current_order_items
    @order.items
  end

  def attempt_to_close_order_with_wrong_total_should_result_in_error
    expect { @order.complete(5.00) }.to raise_error "Total incorrect, please try again"
  end

  def closing_order_with_right_total_user_should_receive_sms
    expect(@order.complete(8.00)).to eq("Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 18:52")
  end

end
