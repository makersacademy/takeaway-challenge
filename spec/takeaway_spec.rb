require 'takeaway'

describe Takeaway do

  describe '#initialize' do
    let(:menu) { double(:menu) }
    let(:basket) { double(:basket) }
    it 'creates a new menu' do
      allow(Menu).to receive(:new).and_return(menu)
      expect(subject.menu).to eq menu
    end
    it 'creates a new basket' do
      allow(Basket).to receive(:new).and_return(basket)
      expect(subject.basket).to eq basket
    end
  end

  #########


  #need to figure out tests here, private methods...
  #so dont to unit test them?? maybe??



  #########
  #describe '#on_menu' do
  #  let(:menu) { double(:menu) }
  #  context 'when menu.on_menu? returns true' do
  #    it 'returns true' do
  #      allow(subject.menu).to receive(:on_menu?).and_return(true)
  #      expect(subject.on_menu?('test')).to eq true
  #    end
  #  end
  #  context 'when menu.on_menu? returns false' do
  #    it 'returns false' do
  #      allow(subject.menu).to receive(:on_menu?).and_return(false)
  #      expect(subject.on_menu?('test')).to eq false
  #    end
  #  end
  #end

  #describe '#show_menu' do
  #  it "should print menu when run" do
  #    allow(subject).to receive(:list_dishes)
  #    expect(STDOUT).to receive(:puts).with('Menu')
  #    subject.show_menu
  #  end
  #end

  #describe '#add_to_basket' do
  #  it "should " do
  #    expect(subject).to respond_to(:add_to_basket).with(2).arguments
  #  end
  #end
end
