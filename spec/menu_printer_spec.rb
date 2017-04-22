require 'menu_printer'

RSpec.describe MenuPrinter do

  it 'expects dependency injection of sub_menu' do
    expect(subject.menu).to be_an_instance_of(Menu)
  end

  it 'expects the menu to be ported from #Menu' do
    expect(subject.menu.the_menu).to include('lamb doner': 5)
  end

  describe '#print_menu' do
    it 'is gives a return value of nil ' do
      expect(subject.print_menu).to eq nil
  end
end
end
