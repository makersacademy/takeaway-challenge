require 'restaurant'

describe Restaurant do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:menu) }

  let(:falafel_item) { double('Falafel', name: 'Falafel', price: '3.50') }
  let(:egg_wrap_item) { double('Egg Wrap', name: 'Egg Wrap', price: '5.10') }
  let(:fresh_juice_item) { double('Fresh Juice', name: 'Fresh Juice', price: '0.70') }

  describe '#initialize' do
    it 'adds a list of items to menu' do
      subject = described_class.new(falafel_item, egg_wrap_item, fresh_juice_item)
      expect(subject.menu).to include(falafel_item, egg_wrap_item, fresh_juice_item)
    end
  end

  describe '#show_menu' do
    it 'outputs a list of menu items' do
      menu_list = "Falafel - £3.50\n"\
      "Egg Wrap - £5.10\n"\
      "Fresh Juice - £0.70\n"
      expect{ subject.show_menu }.to output(menu_list).to_stdout
    end
  end
end
