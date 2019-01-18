require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(@menu) }

  before(:each) do
    @menu = double('menu')
    @list = { "korma": 3, "vindaloo": 4, "korai": 3.5 }
    allow(@menu).to receive(:list).and_return(@list)
    allow(@menu).to receive(:has_dish?).and_return(true)
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

    it 'should add dishes to the basket' do
      takeaway.order('korai')
      expect(takeaway.basket).to eq({:korai=>{:price=>3.5, :quantity=>1}, :korma=>{:price=>3, :quantity=>0}, :vindaloo=>{:price=>4, :quantity=>0}})
    end

    it 'should add multiple dishes to the basket' do
      takeaway.order('korai')
      takeaway.order('korma')
      expect(takeaway.basket).to eq({:korai=>{:price=>3.5, :quantity=>1}, :korma=>{:price=>3, :quantity=>1}, :vindaloo=>{:price=>4, :quantity=>0}})
    end

    it 'should allow quantities to be specified when ordering' do
      takeaway.order('korai', 2)
      takeaway.order('korma', 2)
      expect(takeaway.basket).to eq({:korai=>{:price=>3.5, :quantity=>2}, :korma=>{:price=>3, :quantity=>2}, :vindaloo=>{:price=>4, :quantity=>0}})
    end

    it 'should refuse orders that are not on the menu' do
      allow(@menu).to receive(:has_dish?).and_return(false)
      takeaway.order('fake', 2)
      takeaway.order('another_fake', 3)
      expect(takeaway.basket).to eq({:korai=>{:price=>3.5, :quantity=>0}, :korma=>{:price=>3, :quantity=>0}, :vindaloo=>{:price=>4, :quantity=>0}})
    end

    it 'should collate orders for the same dish together' do
      takeaway.order('vindaloo', 2)
      takeaway.order('korma')
      takeaway.order('vindaloo', 1)
      expect(takeaway.basket).to eq({:korai=>{:price=>3.5, :quantity=>0}, :korma=>{:price=>3, :quantity=>1}, :vindaloo=>{:price=>4, :quantity=>3}})
    end


  end

  context 'it should be able to pretty-print the customer basket' do

    it 'should be able to total the orders' do
      takeaway.order('vindaloo', 2)
      takeaway.order('korma')
      takeaway.order('vindaloo', 1)
      takeaway.checkout
      expect(takeaway.total).to eq(15)
    end

    it 'should print the basket' do
      takeaway.order('korai', 1)
      takeaway.order('korma', 1)
      takeaway.order('vindaloo', 2)
      takeaway.checkout
      expected_output = "korai x 1 (£3.5), korma x 1 (£3), vindaloo x 2 (£8)\nThe total is £14.5"
      expect(takeaway.print_basket).to eq(expected_output)
    end

  end
end