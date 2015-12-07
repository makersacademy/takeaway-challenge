require  'menu'

describe Menu do
subject(:menu_new) do
  described_class.new("CHICKEN CACCIATORE,£13.75,CHICKEN KORMA,£14.99")
end

  it 'Can create a new Menu with 1 argument' do
    expect(Menu).to respond_to(:new).with(1).arguments
  end

  it 'Returns an itemised menu array from a comma seperated string' do
    menu = menu_new
    expect(menu.itemised[0]).to eq(["CHICKEN CACCIATORE","£13.75"])
  end
end
