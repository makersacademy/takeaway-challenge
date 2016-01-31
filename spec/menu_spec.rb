require 'menu.rb'

describe Menu_Print do
    let (:including_class){ Class.new { include Menu_Print } }
      describe '#show'do
        test_menu = {food: 1}
          it 'prints out the menu'do
              expect { including_class.new.show(test_menu) }.to output("Menu:\nfood. Price: £1.00\n").to_stdout
            end
          end
    end
