describe Menu do
  subject(:menu) {described_class.new}
  it 'allows users to select a cuisine' do
    menu.pizza
    expect(menu.food).to eq({margareta: 4, hawaiian: 5})
  end
end
