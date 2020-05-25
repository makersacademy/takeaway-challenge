require 'menu'

describe Menu do
  let (:menu) {Menu.new}
  it 'should respond_to view' do
    expect(menu).to respond_to(:view)
  end
end
