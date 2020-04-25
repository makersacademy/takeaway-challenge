require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:id)  { double :id}
  let(:name) { double :name }
  let(:price) { double :price }
  let(:menu) { double :menu, id: id, name: name, price: price }

  it 'initializing menu' do
    takeaway = TakeAway.new(menu)
    expect(takeaway.menu).to be menu
  end

  describe ' #menu_list' do
      it 'shows menu' do
        takeaway = TakeAway.new(menu)
        expect(takeaway.menu_list). to be menu
      end
    end
end
