require 'order'

describe Order do
  let(:visual_menu)     { "chiken:  5 pounds\nbeef:  5 pounds\nturkey:  10 pounds\n"}
  it { is_expected.to be_instance_of(Order) }
  it { is_expected.to respond_to(:show_menu)}
  it 'shows the menu' do
    expect{subject.show_menu.to_s}.to output(visual_menu).to_stdout
  end
end