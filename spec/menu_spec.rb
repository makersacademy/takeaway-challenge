require_relative '../lib/menu'

describe Menu do

  it 'should display a menu to the customer' do
    expect(subject.display_menu).to eq([["Pounded Yam" , 15],
      ["Jollof Rice", 10],
      ["Fried Rice", 12],
      ["Suya", 6],
      ["Moi Moi", 5]
    ])
  end

end