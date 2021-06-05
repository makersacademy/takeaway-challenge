require 'menu'

describe Menu do
  it 'should have a list of dishes' do
    expect(subject.menu_list).to include(burger: 6.99)
    expect(subject.menu_list).to include(hotdog: 6.99)
    expect(subject.menu_list).to include(fries: 2.99)
  end

  it 'should show the menu' do
    expect(subject.show_menu).to eq({
      burger: 6.99,
      hotdog: 6.99,
      pizza: 7.50,
      fries: 2.99,
    })
  end
end
