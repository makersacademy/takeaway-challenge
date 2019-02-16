require './lib/takeaway.rb'
describe Takeaway do

  let(:menu_double) { double :menu }
  
  describe '#show_menu' do
    before :each do
      @takeaway = Takeaway.new(menu_double)
    end
    it 'Returns a menu when asked' do
      expect(@takeaway.show_menu).to eq menu_double
    end
  end
end
