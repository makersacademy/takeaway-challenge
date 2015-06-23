require 'menu'
describe Menu do
  let(:menu) {Menu.new}
  it 'shows the menu' do
    expect(menu.show).to eq({   cheese_burger: 5,
                                hotdog:        4,
                                lasagne:       5,
                                beer:          2,
                                coke:          2,
                                cheese_cake:   3})
  end
end
