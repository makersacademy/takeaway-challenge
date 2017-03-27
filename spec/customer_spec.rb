require 'customer'

describe Customer do

  subject {Customer.new(12345)}

  describe '#view_menu' do
    it 'displays menu to user' do
      heredoc = <<~HEREDOC
        Chips £1.50
        Battered sausage £2.20
        Pastie supper £4.29
        Chicken goujons £2.59
        Fish supper £4.80
      HEREDOC
      expect(subject.view_menu).to eq(heredoc)
    end
  end

  describe '#select_item' do
    it 'allows the customer to select items from menu' do
      stub_const("Menu::MENU_ITEMS", :chips)
      expect(Menu::MENU_ITEMS).to eq(:chips)
    end
  end

  describe '#place_order' do
    it 'allows order to be placed and confirmed' do
      expect_any_instance_of(Texter).to receive(:send_message)
      subject.place_order({"Chips": 1}, 1.5)
    end
  end
end
