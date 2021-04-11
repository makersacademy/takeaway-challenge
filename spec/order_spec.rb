require 'order'

describe Order do
  let(:visual_menu)     { "chiken:  5 pounds\nbeef:  5 pounds\nturkey:  10 pounds\n"}
  let(:item)            { Menu.new.menu_list[2]}
  it { is_expected.to be_instance_of(Order) }
  it { is_expected.to respond_to(:show_menu)}
  it 'shows the menu' do
    expect{subject.show_menu.to_s}.to output(visual_menu).to_stdout
  end
  it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:add_to_basket).with(1).arguments }

  it 'adds an item to basket' do
    subject.add_to_basket(item)
    expect(subject.basket).to include(item)
  end
end