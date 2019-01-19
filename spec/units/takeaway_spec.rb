require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: @menu, twilio: @messenger) }

  before(:each) do
    @menu = double('menu')
    @messenger = double('messenger')
    @list = { "korma": 3, "vindaloo": 4, "korai": 3.5 }
    allow(@menu).to receive(:list).and_return(@list)
    allow(@menu).to receive(:has_dish?).and_return(true)
    allow(@messenger).to receive(:create_message)
  end

  context 'customers should be able to view the menu' do

    it '#menu' do
      expect(takeaway.menu).to eq(@list)
    end

    it 'should inject a menu into the takeaway class' do
      expect(takeaway.instance_variable_get(:@menu)).to eq @menu
    end

  end

  context 'customers should be able to select orders' do

    it 'should take orders from the customer' do
      expect(takeaway).to respond_to(:order).with(1..2).arguments
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
      takeaway.prepare_order
      expect(takeaway.total).to eq(15)
    end

    it 'should print the basket' do
      takeaway.order('korai', 1)
      takeaway.order('korma', 1)
      takeaway.order('vindaloo', 2)
      takeaway.prepare_order
      expected_output = "korai x 1 (£3.50), korma x 1 (£3.00), vindaloo x 2 (£8.00)\nThe total is £14.50"
      expect(takeaway.print_basket).to eq(expected_output)
    end

    context '#checkout' do

      before(:each) do
        takeaway.order('vindaloo', 2)
        takeaway.order('korma')
        takeaway.order('vindaloo', 1)
        takeaway.prepare_order
      end

      it 'should not give an error if the customer total matches :total' do
        expect { takeaway.checkout(15) }.not_to raise_error
      end

      it "the order should be blocked if the customer total doesn't match" do
        expect { takeaway.checkout(5) }.to raise_error('Halting Order: Unexpected Total')
      end

    end

  end
end