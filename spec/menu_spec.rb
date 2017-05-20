require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double :dish, printed: "Test-Dish, Price $10" }

  it 'is initialized with an empty array of @items' do
    expect(subject.items).to be_empty
  end

  describe '#add' do

    it 'should add items to the menu' do
      expect { menu.add(dish) }.to change { menu.items.count }.by 1
    end

  end

  describe '#show' do

    it 'should print out the empty list correctly' do
      expect(STDOUT).to receive(:puts).with("THIS IS THE MENU:\n\n\nWe look forward to receiving your order!")
      menu.show
    end

    it 'should print out the list with items correctly' do
      menu.add(dish)
      expect(STDOUT).to receive(:puts).with("THIS IS THE MENU:\n\nTest-Dish, Price $10\n\nWe look forward to receiving your order!")
      menu.show
    end

  end

end
