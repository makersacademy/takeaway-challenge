require 'checks'

describe Checks do

  subject(:check) { described_class.new }
  let(:new_order) { double :new_order }
  let(:print_out) { double :print_out }

  describe '#basket?' do
    it 'checks if the basket is empty' do
      expect(new_order).to receive(:order) { [1, 2, 3] }
      check.basket?(new_order)
    end
  end

  describe '#menu?' do
    it 'checks if the item is on the menu' do
      expect(new_order).to receive_message_chain(:menu, :items) {
        { "Morty" => 1.00 }
      }
      expect(print_out).to receive(:match_menu_format)
      check.menu?(new_order, print_out, "Morty")
    end
  end

  describe '#mobile?' do
    it 'checks if the user has entered a valid mobile number' do
      expect(check).to receive(:not_eleven?)
      expect(check).to receive(:not_a_no?)
      check.mobile?("01234567890")
    end
  end

  describe '#not_eleven?' do
    it 'checks for eleven digits' do
      expect(check.not_eleven?("01234567890")).to eq(false)
      expect(check.not_eleven?("0")).to eq(true)
    end
  end

  describe '#not_a_no?' do
    it 'checks for non-number characters' do
      expect(check.not_a_no?("a")).to eq(true)
      expect(check.not_a_no?("0")).to eq(false)
    end
  end

  describe '#order_a' do
    it 'shows receipt when there is something in the basket' do
      allow(check).to receive(:basket?) { false }
      expect(new_order).to receive(:show)
      check.order_a(new_order)
    end
  end

  describe '#order_b' do
    it 'shows a checkout message when there is something in the basket' do
      allow(check).to receive(:basket?) { false }
      expect(print_out).to receive(:checkout)
      check.order_b(new_order, print_out)
    end
  end
end
