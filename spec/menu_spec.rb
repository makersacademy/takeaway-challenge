require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) { { "Burrito" => 8 } }

  it 'responds to dishes' do
    expect(menu).to respond_to(:dishes)
  end

  describe 'print_dishes' do
    specify { expect { menu.print_dishes }.to output("Burrito - £8\nFajitas - £10\nTacos - £5\n").to_stdout }
  end

end
