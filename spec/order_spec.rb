require 'order'

describe Order do

  it { is_expected.to respond_to(:list_options) }

  describe '#list_options' do
    # test needs to be mocked correctly
    it 'displays the options on the menu' do
      menu_double = double(:menu, options: "options")
      expect(subject.list_options).to eq "options"
    end
  end

end
