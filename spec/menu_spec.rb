require 'menu'

describe Menu do
  let(:dish1) { double(:dish, :name => 'name', :price => 'price') }
  let(:dishes_list) { [dish1] }
  subject(:menu) { Menu.new(dishes_list) }

  it { is_expected.to respond_to :get_list }

  context '#get_list' do
    it 'gets a dishes list' do
      expect(subject.get_list).to eq dishes_list
    end

  it 'prints a menu' do
    expect { subject.print_menu }
      .to output("Menu\n1: #{dish1.name} #{dish1.price}£\n" ).to_stdout
  end

  end





end
