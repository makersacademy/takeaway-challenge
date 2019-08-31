require 'menu'

describe Menu do
  let(:dish) { double :dish }
  it 'should be initialized with an empty array' do
    expect(subject.list_menu).to be_empty
  end

  describe '#list_menu' do
    it 'should list dishes with prices on the menu' do
      dish = Dish.new('some dish', 9.0)
      subject.add_dish(dish)
      expect(subject.list_menu).to include(dish)
    end
  end
end
