require 'menu'

describe Menu do
  context '#display' do
    it 'displays a list of menu items' do
      expect { subject.display }.to output(<<-MESSAGE).to_stdout
Burgers
---
Hamburger, £5
Cheeseburger, £6
Chicken burger, £4

Hot Dogs
---
Cheese dog, £5
Chili dog, £6
Corn dog, £4

Chicken
---
Southern fried chicken, £4
Chicken wings, £6
MESSAGE
    end
  end
end
