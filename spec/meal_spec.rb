require 'meal'
require 'menu'

describe Meal do
  it 'stores selected dishes' do
    subject.add("Fish")
    expect(subject.meal).to eq(["Fish"])
  end
end