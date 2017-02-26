require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#show_menu' do
    it { is_expected.to respond_to(:show_menu) }
  end

  it 'should introduce the user' do
    expect(menu.introduction).to eq("Welcome to MA Takeaway. Please order from our tasty selection of dishes!")
  end

end
