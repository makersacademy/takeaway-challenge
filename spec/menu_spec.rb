require 'menu'

describe Menu do
  let(:menu_list) { double("menu_list") }
  subject { described_class.new({ menu_list: menu_list })}

  it "initializes with a @menu_list" do
    expect(subject.get_instance_variable(:@menu_list)).to eql(menu_list)
  end

  it 'prints a list with the whole menu and prices' do
    expect(subject.print_menu).to include("Cheese Burger" => 5)
  end

end
