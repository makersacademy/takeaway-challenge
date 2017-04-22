require 'restaurant'

describe 'restaurant' do
  subject { Restaurant.new }
  describe '#show_menu' do
    it 'expects restaurant to respond to show_menu' do
    expect(subject).to respond_to(:show_menu)
    end

    it 'expects restaurant to show the menu' do
      expect(subject.show_menu).to eql (subject.menu)
    end
  end

  describe '#pretty_print' do
    it 'expects restaurant to respond to pretty_print' do
      expect(subject).to respond_to(:pretty_print)
    end

    it 'expects restaurant to pretty_print' do
      expect(subject.pretty_print). to eq(subject.pretty_print)
    end
  end

  # describe '#order' do
  #   it 'expects the customer to be able to place an order' do
  #     expect
  #   end
  # end

end
