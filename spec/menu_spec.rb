require 'menu'

describe Menu do
  it { is_expected.to respond_to(:show_menu) }

  it 'should add item to menu' do
    subject.add_dish('pizza', 2.99)
    expect(subject.show_menu).to include('pizza'=>2.99)
  end

end
