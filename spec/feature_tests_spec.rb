require 'main'
require 'tempfile'

feature 'Menu features' do
  scenario "Loading the menu" do
    given_there_is_a_menu
    and_there_is_a_csv_file_given
    the_menu_items_are_added_from_the_file
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
  @menu.load_from_csv
end
