describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows menu' do
    order = Order.new
    expect { order.show_menu }.to output(/Menu/).to_stdout
  end
end
