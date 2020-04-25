require 'menu'

describe Menu do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:items) }

  let(:falafel_item) { double('Falafel', name: 'Falafel', price: '3.50') }
  let(:egg_wrap_item) { double('Egg Wrap', name: 'Egg Wrap', price: '5.10') }
  let(:fresh_juice_item) { double('Fresh Juice', name: 'Fresh Juice', price: '0.70') }

  let(:hofun_item) { double('Hofun', name: 'Hofun', price: '5.20') }
  let(:noodle_item) { double('Noodles', name: 'Noodles', price: '2.20') }
  let(:rice_item) { double('Rice', name: 'Rice', price: '1.75') }

  describe '#initialize' do
    it 'adds a list of items to menu' do
      subject = described_class.new(falafel_item, egg_wrap_item, fresh_juice_item)
      expect(subject.items).to include(falafel_item, egg_wrap_item, fresh_juice_item)
    end
  end

  describe '#show_menu' do
    it 'outputs a list of Falafel shop menu items' do
      menu_list = "Falafel - £3.50\n"\
      "Egg Wrap - £5.10\n"\
      "Fresh Juice - £0.70\n"
      subject = described_class.new(falafel_item, egg_wrap_item, fresh_juice_item)
      expect{ subject.show_menu }.to output(menu_list).to_stdout
    end

    it 'outputs a list of chinese menu items' do
      menu_list = "Hofun - £5.20\n"\
      "Noodles - £2.20\n"\
      "Rice - £1.75\n"
      subject = described_class.new(hofun_item, noodle_item, rice_item)
      expect{ subject.show_menu }.to output(menu_list).to_stdout
    end
  end
end
