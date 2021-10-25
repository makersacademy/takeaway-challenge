require 'ui'
require 'menu'
require 'read'
require 'write'

PRINTED_LIST = "1 Spaghetti:12\n2 Macaroni:9\n".freeze
PRINT_DISHES = [Dish.new("Spaghetti", 12), Dish.new("Macaroni", 9)].freeze
DISH_2 = 2

describe Ui do
  it "should display menu" do
    $argument = ""
    menu_mock = double("menu", :display_dishes => PRINTED_LIST)
    write_mock = double("write_mock", :write => PRINTED_LIST)
    subject = Ui.new(Menu.new(PRINT_DISHES), menu_mock, write_mock)
    expect(subject.display_menu).to eq PRINTED_LIST
  end
  it "should read user selected dish" do
    mock_dish = double("mock_dish", :read_chomp => DISH_2)
    subject = Ui.new(Menu.new(PRINT_DISHES), mock_dish)
    expect(subject.select_dish).to eq DISH_2
  end
  it "should assert complete if read q" do
    mock_quit = double("mock_quit", :read_chomp => 'q')
    subject = Ui.new(Menu.new(PRINT_DISHES), mock_quit)
    subject.select_dish
    expect(subject.complete).to eq true
  end
end
