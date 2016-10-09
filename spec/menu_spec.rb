require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#show_menu' do
    specify { expect { menu.show_menu }.to output.to_stdout }
  end
end
