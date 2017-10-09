require 'options'

describe Options do
  subject(:options) { described_class.new }

  describe '#request_menu_selection' do
    it 'should ignore an invalid menu entry' do
      allow(subject).to receive(:gets).and_return("ZZ")
      expect { subject.request_menu_selection }.to raise_error 'Invalid selection: please check and try again'
    end
  end

  # describe '#request_menu_selection' do
  #   it 'should ignore an invalid menu entry' do
  #     allow(subject).to receive(:gets).and_return("M")
  #     expect { subject.request_menu_selection }
  #       .to output("#{Menu::MENU_HEADER}#{Menu::MENU_ITEM_HEADER}#{Menu::MENU_ITEMS}").to_stdout
  #   end
  # end

end
