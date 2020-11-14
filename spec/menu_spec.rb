require 'menu'

describe Menu do
  let(:dish1) { double(:dish, :name => 'name', :price => 'price') }
  let(:dish2) { double(:dish, :name => 'name', :price => 'price') }
  let(:dish3) { double(:dish, :name => 'name', :price => 'price') }
  let(:dishes_list) { [dish1, dish2, dish3] }

  subject(:menu) { Menu.new(dishes_list) }

  it { is_expected.to respond_to :give_list }

  context '#give_list' do
    it 'gives a dishes list' do
      expect(subject.give_list).to eq dishes_list
    end
  end

  context '#print_menu' do
    it 'prints a menu' do
      expect { subject.print_menu }
        .to output("Menu\n1: #{dish1.name} #{dish1.price}£\n" +
         "2: #{dish2.name} #{dish2.price}£\n" +
         "3: #{dish3.name} #{dish3.price}£\n").to_stdout
    end
  end
end
