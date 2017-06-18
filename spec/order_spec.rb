require "./lib/menu.rb"
require "./lib/order.rb"

describe Order do

  describe '#initialize' do
    it 'should take an instance of menu as an argument' do
      expect(subject.menu).to be_an_instance_of(Menu)
    end

    it 'should initialize with an empty basket' do
      expect(subject.basket).to be_empty
    end

    it 'should initialize with a total of 0' do
      expect(subject.total).to eq 0
    end
  end

  describe '#select_item' do
    it 'allows user to select some number of several available dishes' do
      expect(subject).to respond_to(:select_item).with(2).arguments
    end

    before do
      subject.select_item(1)
    end

    it 'adds my item to the basket' do
      expect(subject.basket).to eq([{ item_number: 1, menu_item: :vegetarian_enchiladas, price: 9.99 }])
    end
  end

  describe '#view_basket' do

    before do
      subject.select_item(1)
      subject.select_item(2)
      subject.view_basket
    end

    it 'calculates the total of my order' do
      expect(subject.total).to eq(19.98)
    end

    # it 'should give a summary of the order' do
    #   expect(STDOUT).to receive(:puts).with("your total amount is $19.98 dollars")
    # end
  end
end
