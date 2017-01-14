require 'menu'

describe Menu do
  it 'should respond to the method see_dishes' do
    expect(subject).to respond_to :see_dishes
  end
end
