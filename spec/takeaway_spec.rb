require 'takeaway'

describe TakeAway do
  let(:menu_class) { double :menu_class, dishes: [item: :sushi, price: 7] }
  let(:takeaway) {described_class.new(menu_class)}
  it 'allows user to see a menu' do
    allow(takeaway).to receive(:read_menu).and_return menu_class.dishes
    expect(takeaway.read_menu).to eq [item: :sushi, price: 7]
  end
end
