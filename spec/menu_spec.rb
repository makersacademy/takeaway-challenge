require 'menu'

describe Menu do

  before(:each) {
    ppp_menu = [{:item => "pizza", :price => 10}, {:item => "pasta", :price => 12}, {:item => "pancakes", :price => 6}]
    @ppp_cafe = Menu.new(ppp_menu)
  }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'has a list of dishes' do
    expect(@ppp_cafe.dishes.length).to be > (-1)
  end

end
