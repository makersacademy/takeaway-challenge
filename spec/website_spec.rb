require 'website'

describe Website do

  let(:menu) { double(:menu, list: { 'Dough balls' => 4, 'Bruschetta' => 6, 'Olives' => 3,
    'Margherita' => 9, 'Padana' => 13, 'Giardinera' => 11 })
  }
  let(:send_sms) { double(:send_sms, new: "Thank you! Your order was placed and will be delivered before 18:52")}

  describe '#show_menu' do
    it 'will show the menu' do
      pizza = Website.new
      expect(pizza.show_menu).to eq({ 'Dough balls' => 4, 'Bruschetta' => 6, 'Olives' => 3,
        'Margherita' => 9, 'Padana' => 13, 'Giardinera' => 11 })
    end
  end

  describe '#select' do
    it 'will allow me to select the dish I want' do
      subject.select("Dough balls", 2)
      expect(menu.list).to include(subject.item)
    end

    it 'will allow me to select the quantity I want' do
      subject.select('Dough balls', 2)
      expect(subject.quantity).to eq(2)
    end
  end

  describe '#confirmation' do
    it 'will raise an error if the customer cannot confirm the amount' do
      subject.select("Dough balls", 2)
      subject.confirm_amount(10)
      expect{subject.confirmation}.to raise_error('There was a problem placing your order, please try again.')
    end

    it 'will send an sms if the order is correct' do
      subject.select("Dough balls", 2)
      subject.confirm_amount(8)
      expect(subject.confirmation).to eq(send_sms.new)
    end
  end
end
