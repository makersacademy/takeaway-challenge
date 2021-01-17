require 'takeaway'

describe Takeaway do
  #let(:menu) { double :menu, price: '£1.00', contains?: true }
  #subject(:order) { described_class.new(menu) }
  context 'starting up with printable menu' do
    it "should initialize with a hash menu" do
      expect(subject.menu.dishes).to be_a Hash
    end

    it "should print dishes on show_menu" do
      expect{subject.show_menu}.to output.to_stdout
    end
  end

  context 'ordering food' do
    it 'should only accept items from the menu' do
      expect{ subject.add "Boiled goose"}.to raise_error("Sorry, no boiled goose.")
    end

    it 'should output confirmation' do
      message = "3x Plantastic burger(s) added to your basket."
      expect{ subject.add 'Plantastic burger', 3 }.to output(message).to_stdout
    end

    before do
      subject.add 'Plantastic burger', 3
    end

    it 'should add items to a basket' do
      expect(subject.basket.select { |x| x["Plantastic burger"]  == 8 }.length).to eq 3
    end

    it 'should compute the correct total' do
      expect(subject.basket_total).to eq 24
    end
  end
end
