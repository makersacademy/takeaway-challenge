require "menu"

describe Menu do 
subject(:menu) {described_class.new}

 it { should respond_to(:dishes) }


end