describe "user_stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'so I can check if I want to order, see a list of dishes with prices' do
    order = Order.new
    list = List.new
    expect { order.show(list) }.not_to raise_error
  end

end
