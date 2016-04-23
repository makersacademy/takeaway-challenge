require 'user.rb'
require 'menu.rb'

describe User do
  it 'can view menu' do
    expect(subject.view).to be_a(Array)
  end
end