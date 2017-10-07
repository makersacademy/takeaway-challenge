require 'Takeaway.rb'

describe Takeaway do

  let(:menu) { double :menu }

  describe '#menu' do
    it 'stores a list of all dishes and prices' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      allow(subject).to receive(:menu).and_return([["doner", 5], ["burger", 10], ["pizza", 20]])
    end
  end

  describe '#show_menu' do
    it 'displays menu items to customer' do
      menu = [["doner", 5]]
      allow(subject.show_menu(menu)).to receive(:menu).and_return("doner 5")
    end
  end

end
