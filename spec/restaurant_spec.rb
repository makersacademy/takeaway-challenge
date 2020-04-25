require 'restaurant'

describe Restaurant do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:menu) }

  describe '#show_menu' do
    it 'outputs a list of menu items' do
      menu_list = "Falafel - £3.50\n"\
      "Egg Wrap - £5.10\n"\
      "Fresh Juice - £0.70\n"
      expect{ subject.show_menu }.to output(menu_list).to_stdout
    end
  end
end
