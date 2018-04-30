require 'order'

describe Order do
  let(:fake_messager) { double :fake_messager, send_text: "Thank you! Your order was placed and will be delivered before 21:30"}
  let(:fake_menu) { double :fake_menu, list_dishes: "the menu is empty", contains?: variable, menu: { cake: 2} }
  let(:variable) { true }
  subject { Order.new(fake_menu, fake_messager) }

  describe '#initialize' do
    it 'creates a empty order' do
      expect(subject.items).to eq({})
    end
  end

  describe '#show_menu' do
    it 'prints the menu' do
      allow(subject.show_menu).to receive(fake_menu.list_dishes).and_return(fake_menu.list_dishes)
    end
  end

  describe '#add_dish', :add do
    it 'adds the selected dish and quantity to the order list if dish in menu' do
      subject.add_dish(:cake)
      expect(subject.items).to eq({ :cake => 1})
    end

    context 'Item does not exist' do
    let(:variable) { false }

    it 'does not add a dish if that dish is not in menu' do
      subject.add_dish(:not_on_menu)
      expect(subject.items).to eq({})
    end
  end
  end

  describe '#correct_order?' do
    it 'checks if total given matches the sum of dishes' do
      subject.add_dish(:cake, 2)
      expect(subject.correct_order?(4)).to eq(true)
    end
  end

  describe '#checkout(time)' do
    it 'sends a text confirming time' do
      expect(subject.checkout).to eq("Thank you! Your order was placed and will be delivered before 21:30")
    end
  end

end
