require 'menu'

describe Menu do
  subject(:menu) { described_class.new(list) }

  let(:list) do [{ id: 1, name: "Kebap", price: 1.0 },
                 { id: 2, name: "Breakfast", price: 2.0 },
                 { id: 3, name: "Pizza", price: 3.0 }]
  end

  let(:user_list) { "{:id=>1, :name=>\"Kebap\", :price=>1.0} {:id=>2, :name=>\"Breakfast\", :price=>2.0} {:id=>3, :name=>\"Pizza\", :price=>3.0}" }

  it 'show initialized list' do
    expect(menu.list).to eq list
  end

  it 'generates list for user' do
    expect(menu.generator).to eq user_list
  end

end
