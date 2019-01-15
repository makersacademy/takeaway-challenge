require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(@menu) }

  before(:each) do
    @menu = double('menu')
    @list = { "korma": 3, "vindaloo": 4, "korai": 3.5 }
    allow(@menu).to receive(:list).and_return(@list)
  end

  context 'customers should be able to view the menu' do

    it '#menu' do
      expect(takeaway.menu).to eq(@list)
    end

    it 'should inject a menu into the takeaway class' do
      expect(takeaway.instance_variable_get(:@menu)).to eq @menu
    end

    it 'should create its own menu if none provided' do
      standalone_takeaway = Takeaway.new
      default_menu = { korma: 4, jalfrezi: 6, pilau: 2, naan: 2.5 }
      expect(standalone_takeaway.menu).to eq(default_menu)
    end

  end

  context 'customers should be able to select orders' do

    it 'should take orders from the customer' do
      expect(takeaway).to respond_to(:order).with(1..2).arguments
    end

    it 'should add orders to the basket' do
      takeaway.order('korai')
      takeaway.order('vindaloo', 2)
      takeaway.order('korma')
      expect(takeaway.basket).to eq('korai x 1 (£3.5), vindaloo x 2 (£8), korma x 1 (£3)')
    end

    xit 'should refuse orders that are not on the menu' do

    end
  end
end