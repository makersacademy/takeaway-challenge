require 'menu'

describe Menu do

  subject(:takeaway) { described_class.new }

  it 'should respond to the method see_dishes' do
    expect(takeaway).to respond_to(:see_dishes)
  end

  it 'should respond to the method select_dishes' do
    expect(takeaway).to respond_to(:select_dishes)
  end
end
