require_relative '../lib/order'

describe Order do
  let(:menu) { double :menu }

  it 'shows the menu properly' do
    hash_example = { dish: :price }
    subject = Menu.new hash_example
    expect(subject.show_menu).to eq("#{:dish}, £ #{:price}\n")
  end

  it 'adds a dish x times when ordered' do
    hash_example = { dish: :price }
    subject.add_order(:dish, 2)
    expect(subject.ordered_dishes).to eq [:dish, :dish]
  end
end