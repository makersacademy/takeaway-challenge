require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  it 'has a menu with a list of dishes and prices' do
    items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
    allow(menu).to receive(:items).and_return items
    takeaway = Takeaway.new(menu)
    expect(takeaway.view_menu).to eq items
  end
end
