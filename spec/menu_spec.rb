require "menu"
describe Menu do
  it { is_expected.to respond_to :show_menu }
  it { is_expected.to respond_to :add2_menu }
end
