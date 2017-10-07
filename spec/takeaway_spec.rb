require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu, dishes: { sushi: '£7.99' } }
  let(:takeaway) {described_class.new(menu)}
  it 'allows user to see a menu' do
    allow(menu).to receive(:show).and_return menu.dishes
    expect(takeaway.read_menu).to eq(menu.dishes)
  end
end
