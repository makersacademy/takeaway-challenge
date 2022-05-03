require 'menu'

describe Menu do
  it 'can display list of available items' do 
    expect(subject.dishes).to include({pomodoro: 10})
  end
end