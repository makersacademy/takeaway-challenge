require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:basket) { double({ :"chow mein" => [4, 5.0] }) }
  let(:current_value) { double(:current_value) }
  let(:dish) { double(:dish) }

  it 'is initialized with an empty basket' do
    expect(order.basket).to be_empty
  end

  describe "#ordered_dishes" do
    it "updates the basket when one dish is added" do
      order.add_dish
      expect(order.basket).to have_key(:"chow mein")
    end
  end

  describe "#deleted_dish" do
    it "updates the basket when one dish is deleted" do
      order.add_dish
      order.deleted_dish(dish)
      expect(order.basket).not_to have_key(:"chow mein")
    end
  end
end
