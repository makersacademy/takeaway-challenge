require_relative '../../lib/dish'
require_relative '../../lib/menu_data'
DISHES = [Dish.new("Spaghetti", 12), Dish.new("Macaroni", 9)].freeze
feature 'MenuData' do
  scenario 'Can list dish' do
    MenuData.truncate_table
    MenuData.save(DISHES)
    visit('/ui')
    expect(page).to have_content 'Spaghetti: £12'
  end
end