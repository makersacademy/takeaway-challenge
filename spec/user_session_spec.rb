require 'user_session'
require 'menu'
require 'simplecov'

describe UserSession do
  let (:payment_confirmation) {double :payment_confirmation}
  sms_file = "sms_file"
  korma = "Korma"

  describe '#initialize' do
    it 'initializes with a new Menu instance' do
      expect(subject.menu).to be_a(Menu)
    end
    it 'initializes with a basket' do
      expect(subject.basket).to be_a(Basket)
    end
  end

  describe '#decision' do

    it "calls menu reader when input is 1" do
      allow(subject).to receive(:input).and_return("1")
      expect(subject.decision).to receive{subject.menu.menu_reader}
    end

    it "calls menu selector when input is 2" do
      allow(subject).to receive(:input).and_return("2")
      expect(subject.decision).to receive(subject.menu_selector)
    end

    it "calls basket.view_basket when input is 3" do
      allow(subject).to receive(:input).and_return("3")
      expect(subject.decision).to receive(subject.basket.view_basket)
    end

    it "calls payment_confirmation when input is 4" do
      allow(subject).to receive(:input).and_return("4")
      expect(subject.decision).to receive(subject.payment_confirmation)
    end

    it "exits when input is 5" do
      allow(subject).to receive(:input).and_return("5")
      expect(subject.decision).to receive(exit)
    end

    it 'returns invalid selection message when user input invalid' do
      allow(subject).to receive(:input).and_return("antarctic penguin")
      expect{subject.decision}.to output("Selection not available on menu").to_stdout
    end

  end

  describe '#menu_selector' do

  before(:each) do
    subject.input = "Korma"
    subject.menu_selector
  end

    it 'returns input added to basket' do
      expect{subject.menu_selector}.to output("#{subject.input.capitalize} added to basket\n").to_stdout
    end

    it 'adds input to basket' do
      expect{subject.menu_selector}.to change(subject.basket.basket)
    end

    it 'adds input value to total array' do
      expect(subject.basket.total).to include(subject.menu.menu_hash[subject.input])
    end

    it 'calls the choice_text method with invalid input' do
      allow(subject).to receive(:input).and_return("antarctic penguin")
      expect{subject.menu_selector}.to output("Selection not available on menu").to_stdout
    end
  end

  describe '#choice_text' do
    it 'receives decision method' do
      expect(subject.choice_text).to receive(:decision)
    end
  end

end      