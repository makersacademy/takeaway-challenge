require 'menu'

describe Menu do

  before(:each) {
    @ppp_menu = [{:item => "pizza", :price => 10}, {:item => "pasta", :price => 12}, {:item => "pancakes", :price => 6}]
    @ppp_cafe = Menu.new(@ppp_menu)
  }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'has a list of dishes' do
    expect(@ppp_cafe.dishes.length).to be > (-1)
  end

  it 'responds to #list_dishes' do
    expect(@ppp_cafe).to respond_to(:list_dishes)
  end

  it 'can list dishes' do
    @ppp_cafe.list_dishes
    expect(@ppp_cafe.dish_list[0]).to eq "#{@ppp_menu[0][:item]} - £#{@ppp_menu[0][:price]}"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'responds to #order' do
    expect(@ppp_cafe).to respond_to(:order)
  end

  it '#order creates new order instance' do
    items = [2, "pizza", 1, "pasta"]
    expect{ @ppp_cafe.order(items) }.to change{ @ppp_cafe.orders.length }.by (1)
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  # it 'allows customer to check total quantity' do
  #   expect(@ppp_cafe).to respond_to(:quantity_check).with(1)
  # end


end
