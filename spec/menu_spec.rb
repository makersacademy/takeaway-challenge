require 'menu'

describe Menu do

  before(:each) {
    @ppp_menu = [{:item => "pizza", :price => 10}, {:item => "pasta", :price => 12}, {:item => "pancakes", :price => 6}]
    @ppp_cafe = Menu.new(@ppp_menu)
  }

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

  it 'responds to #order' do
    expect(@ppp_cafe).to respond_to(:order)
  end

  it '#order creates new order instance' do
    items = [{:pizza => 2, :pasta => 1}, 3]
    expect{ @ppp_cafe.order(items) }.to change{ @ppp_cafe.orders.length }.by (1)
  end

end
