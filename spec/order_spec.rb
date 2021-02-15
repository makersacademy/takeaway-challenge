require 'order'

describe Order do

  before do
    @menu = Menu.new
  end

  describe '#read_menu' do
    it 'should return the menu' do
      expect(subject.read_menu).to print(@menu.items)
    end
  end

  describe '#add' do
    it 'should take 2 arguments' do
      expect(subject).to respond_to(:add).with(2).arguments
    end

    it 'should add the selected dish and amount to the basket' do
      subject.add("Bhindi", 5)
      expect(subject.basket).to eq([{ :dish => "Bhindi", :amount => 5 }])
    end
  end

  # describe '#total' do
  #   expect(subject.total).to eq()
  #
  # end

end
