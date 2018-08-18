require 'main'

feature 'Menu features' do
  scenario "Viewing the menu" do
    given_there_is_a_menu
    when_i_ask_to_view_the_menu
    then_the_list_of_dishes_and_prices_should_display
  end
end


def given_there_is_a_menu
  @menu = Menu.new('menu')
end

def when_i_ask_to_view_the_menu
  @menu.view_menu
end

def then_the_list_of_dishes_and_prices_should_display
  expect(@menu.view_menu).to have_content(@menu.menu_list)
end
