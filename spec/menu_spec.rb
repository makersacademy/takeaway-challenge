require 'menu'

describe Menu do

  let(:menu) { Menu.new(list) }
  let(:list) { double :list, dishes: [ :pappadom_preach, :jalfrezi_rock, :rice_rice_baby ] }

  it {is_expected.to respond_to(:add_to_order) }
  it {is_expected.to respond_to(:see_list) }

  describe '#display' do
    it 'displays a menu' do
      expect { menu.display }.to output.to_stdout
    end
  end

  describe '#total' do
    it 'adds the total cost of the dishes to the sum' do
      expect(menu.total).to eq(8.5)
    end
  end


end
