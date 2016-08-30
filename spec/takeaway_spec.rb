require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }

  before do
    allow(menu).to receive(:included?)
  end

  context '#print_menu' do
    it 'will allow user to view the menu' do

    end
  end

  context '#select_food' do
    it 'should raise an error if food is not on menu' do
      takeaway = subject.select_food("pancakes", 5)
      expect{takeaway}.to raise_error(RuntimeError)
    end
  end

  context '#checkout' do
    it 'should give back the total'
  end

end
