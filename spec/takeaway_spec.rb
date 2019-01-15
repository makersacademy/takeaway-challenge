require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(@menu) }

  before(:each) do
    @menu = double('menu')
  end

  context 'customers should be able to view the menu' do

    it '#menu' do
      menu = ""
      expect(subject.menu).to eq(menu)
    end

    it 'should inject a menu into the takeaway class' do
      expect(takeaway.instance_variable_get(:@menu)).to eq @menu
    end



  end

end