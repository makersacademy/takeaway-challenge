
class Menu

  attr_reader :menu

  def initialize
    @menu = [
        { 1 => { dish: 'Whole Chicken', price: 11.50 } },
        { 2 => { dish: 'Half Chicken', price: 8.50 } },
        { 3 => { dish: 'Quarter Chicken', price: 5.50 } },
        { 4 => { dish: 'Burger', price: 8.00 } },
        { 5 => { dish: 'Wagyu Burguer', price: 9.50 } },
        { 6 => { dish: 'Double Wagyu Burger', price: 12.00 } },
        { 7 => { dish: 'Lamb Kofta Burger', price: 8.00 } },
        { 8 => { dish: 'Falafel Burger', price: 8.00 } },
        { 9 => { dish: 'Moutabal', price: 2.00 } },
        { 10 => { dish: 'Fattoush', price: 2.50 } },
        { 11 => { dish: 'Tabbouleh', price: 2.50 } },
        { 12 => { dish: 'Corn On The Cob', price: 2.00 } },
        { 13 => { dish: 'Coleslaw', price: 2.00 } },
        { 14 => { dish: 'Fries', price: 3.00 } }

      ]
    end

  def show
    puts <<END_HEREDOC
                         _______         __
                        |   |   |.---.-.|__|.-----..-----.
                        |       ||  _  ||  ||     ||__ --|
                        |__|_|__||___._||__||__|__||_____|

                    Rotissery Chicken

                    1. Whole (with three sauces)         £11.50
                    2. Half (with two sauces)             £8.50
                    3. Quarter (with one sauce)           £5.50

                    Grill

                    4. Burger (bacon & blue cheese )      £8.00
                    5. Wagyu burger                       £9.50
                    6. Double Wagyu burger               £12.00
                    7. Lamb kofta burger                  £8.00
                    8. Falafel burger                     £8.00

                          _______  __     __
                         |     __||__|.--|  |.-----..-----.
                         |__     ||  ||  _  ||  -__||__ --|
                         |_______||__||_____||_____||_____|

                    9.  Moutabal                          £2.00
                    10.  Fattoush                         £2.50
                    11.  Tabbouleh                        £2.50
                    12.  Corn on the cob                  £2.00
                    13.  Coleslaw                         £2.00
                    14.  Fries                            £3.00


END_HEREDOC

    end
end
