require 'order'

describe Order do

  let(:dish) { "Hash Brown" }
  let(:menu) { double :menu }
  let(:text) { double :text }


  describe 'when created' do
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:menu) }
    # it { is_expected.to respond_to(:text) }

    it 'has an empty order array' do
      expect(subject.order).to eq []
    end
  end

  describe '#show_menu' do

    it { is_expected.to respond_to(:show_menu) }

    it 'shows the customer the menu' do
      allow(menu).to receive(:menu) {{"Egg McMuffin"=>2.5, "Hash Brown"=>1}}
      expect { subject.show_menu }.to output("McDonalds Breakfast Menu\n------------------------\nEgg McMuffin.....£2.50\nHash Brown.....£1.00\n").to_stdout
    end
  end

  describe '#select_dish' do

    it { is_expected.to respond_to(:select_dish).with(1).argument }

    it 'puts the dishes in the order array' do
      expect { subject.select_dish(dish) }.to change { subject.order.length }.by 1
    end
  end

  describe '#total' do
    it { is_expected.to respond_to(:total) }

    it 'totals 1 pound when 1 hash brown added' do
      subject.select_dish(dish)
      expect(subject.total).to eq 1
    end

    it 'totals 2 pound when 2 hash brown added' do
      subject.select_dish(dish)
      subject.select_dish(dish)
      expect(subject.total).to eq 2
    end
  end

  describe '#see_order' do
    it { is_expected.to respond_to(:see_order) }

    it 'prints order so customer can check' do
      subject.select_dish(dish)
      expect { subject.see_order }.to output("Your order:\n1 x Hash Brown...£1.00\nTotal = £1.00\n").to_stdout
    end
  end

  describe '#text_confirmation' do
    it { is_expected.to respond_to(:text_confirmation).with(1).argument }
    it 'sends a text confirmation' do
      allow(text).to receive(:send_sms).with("£1", "+447899916069")
    end
  end
end
