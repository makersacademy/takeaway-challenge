require 'customer'

describe Customer do

  subject {Customer.new(12345)}
  let(:food_item) {double :food_item}

  it { is_expected.to be_instance_of(Customer)}

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
end
