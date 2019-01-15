require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(@menu) }

  before(:each) do
    @menu = double('menu')
    @list = {korma: 3, vindaloo: 4, korai: 3.5}
    allow(@menu).to receive(:list).and_return(@list)
  end

  context 'customers should be able to view the menu' do

    it '#menu' do
      expect(takeaway.menu).to eq(@list)
    end

    it 'should inject a menu into the takeaway class' do
      expect(takeaway.instance_variable_get(:@menu)).to eq @menu
    end



  end

end