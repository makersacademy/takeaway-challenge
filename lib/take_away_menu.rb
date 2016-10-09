class TakeAwayMenu
attr_reader :items, :list_dishes
def initialize
  @items = {'pasta' => 5, 'chips' => 2, 'salad' => 4, 'pizza' => 6, 'soup' => 5}
end

    def list_dishes
       "1. pasta: £5.00"
       "2. chips: £2.00"
       "3. salad: £4.00"
       "4. pizza: £6.00"
       "5. soup:  £5.00"
    end

end
