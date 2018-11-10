describe '#user_stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "so that I can order something, see a list of dishes with prices" do
      order = Order.new
      dishes = Dishes.new
      expect { dishes.list(order) }.not_to raise_error
  end
end
