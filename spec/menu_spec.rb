require 'menu'

describe Menu do
  it 'should respond to the method see_dishes' do
    expect(subject).to respond_to(:see_dishes)
  end

  it 'should respond to the method select_dishes' do
    expect(subject).to respond_to(:select_dishes)
  end
end
