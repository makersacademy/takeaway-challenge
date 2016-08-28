require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#print_menu' do
    specify { expect { menu.print_menu }.to output.to_stdout }
  end


end
