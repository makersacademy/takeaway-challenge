require 'menu'

describe Menu do

  let(:menu) {Menu.new}
  it 'can store a list of items on the menu' do
    expect(menu.items).to eq [{:pizza => "Margherita", :price =>  9.99}, 
                              {:pizza => "Neapolitan", :price => 12.99}, 
                              {:pizza => "Greek", :price => 13.99},
                              {:pizza => "Padana", :price => 11.99}]
  end

  it 'can return a list of items available on the menu' do
    expect{menu.view}.to output("Margherita, £9.99\nNeapolitan, £12.99\nGreek, £13.99\nPadana, £11.99\n").to_stdout
  end
end