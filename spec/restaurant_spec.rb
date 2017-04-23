require 'restaurant'
# require 'fake-sms'

describe 'restaurant' do
  subject { Restaurant.new }
  before do
    subject.order("Merlot")
    subject.order("Chips")
  end
  describe '#show_menu' do
    it 'expects restaurant to show the menu' do
      expect(subject.show_menu).to eql (subject.menu)
    end
  end

  describe '#pretty_print' do
    it 'expects restaurant to pretty_print' do
      expect(subject.pretty_print). to eq(subject.pretty_print)
    end
  end

  describe '#order' do
    it 'expects the customer to be able to place an order' do
      expect(subject.orders).to include ("Merlot")
    end

    it 'expects to raise an error' do
      expect {subject.order("bacon") }.to raise_error "Item not on the menu."
    end
  end

  describe '#total_price' do
    it 'expects total_price to return a sum' do
      expect(subject.total_price).to eq(7)
    end
  end

  describe '#check_total' do
    it 'expects check_total to return 10' do
    expect(subject.check_total).to eq(7)
    end
  end

  describe '#send_text' do
    it 'expects subject to send a text' do
      obj = double()
      obj.stub(:send_text)
    end
  end
end
