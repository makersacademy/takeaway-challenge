require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double :dish }

  it 'is initialized with an empty array of @items' do
    expect(subject.items).to be_empty
  end

  describe '#add' do

    it 'should add items to the menu' do
      expect { menu.add(dish) }.to change { menu.items.count }.by 1
    end

  end

  describe '#show' do

    it 'should print out the list of items' do
      expect(STDOUT).to receive(:puts).with("THIS IS THE MENU:\n\n\nWe look forward to receiving your order!")
      menu.show
    end

  end

end
