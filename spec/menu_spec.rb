require_relative '../lib/menu'

describe Menu  do
  it 'shows the menu properly' do
    hash_example = { dish: :price }
    subject = Menu.new hash_example
    expect(subject.show_menu).to eq("#{:dish}, £ #{:price}\n")
  end
end