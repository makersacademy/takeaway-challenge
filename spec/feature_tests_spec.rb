require 'order'
require 'tempfile'
require 'byebug'

feature 'Menu features' do

  scenario "Loading the menu" do
    given_there_is_a_menu
    and_there_is_a_csv_file_given
    the_menu_items_are_added_from_the_file
  end
end


feature 'Order features' do

  scenario "Loading a menu for an order" do
    when_someone_wants_to_start_an_order
    given_there_is_a_menu
    and_there_is_a_csv_file_given
    the_menu_items_are_added_from_the_file
    the_menu_items_are_listed_on_screen
  end

end

def given_there_is_a_menu
  @menu = Menu.new
end

def and_there_is_a_csv_file_given
  @filename = Tempfile.new("test.csv")
  @filename.syswrite("foodname,price\ntomatoes,£1\ncucumber,£3")
end

def the_menu_items_are_added_from_the_file
  @menu.load_from_csv(@filename.path)
end

def when_someone_wants_to_start_an_order
  @order = Order.new
end

def the_menu_items_are_listed_on_screen
  expected_menu_list = [
    {"foodname" => "tomatoes", "price" => "£1"},
    {"foodname" => "cucumber", "price" => "£3"},
  ].to_s + "\n"
  expect{ @order.load_menu(@filename.path) }.to output(expected_menu_list).to_stdout
end
