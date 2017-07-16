require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }

    it 'lists dishes with prices' do
      expect(takeaway.menu).to eq("Prawn Toast (4): £4.25")
    end
  end
  describe '#read_menu' do
    it 'allows you to read list of dishes with prices' do
    end
  end
  describe '#select_dishes' do
    it 'allows you to select available dishes from the menu' do
    end
    it 'raises an error if dishes are unavailable' do
    end
  end
  describe '#summarise_order' do
    it 'shows a summary of the dishes selected with total price' do
    end
    it 'raises an error if order summary is incorrect' do
    end
  end
  describe '#checkout' do
    it 'allows you to confirm that you are happy to complete order' do
    end
  end
  describe '#complete order' do
    it 'sends order confirmation text' do
    end
  end
