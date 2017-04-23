require 'customer_order'

feature 'Feature test - Dishes -> Menus -> CustomerOrder -> Verify -> Texting' do

      scenario 'Ordering Food and receiving confirmation' do
        create_entities
        add_dishes_to_menus
        print_the_menu
        remove_some_dishes_from_the_menu
        print_the_menu
        add_dishes_to_customer_order
        update_the_order
        customer_verifies_their_total
        add_more_dishes_to_customer_order
        update_the_order
        customer_verifies_their_total
        send_a_text_confirmation
        end

      def create_entities
        @fruit_b = Dish.new('Fruit Basket', 10.99)
        @eggs_b = Dish.new('Eggs Bennedict', 11.99)
        @salad_n = Dish.new("Salad Nicoise", 10.99)
        @lobser_t = Dish.new("Lobster Thermidore", 28.00)
        @s_chicken = Dish.new("Sweet & Sour Chicken", 9.99)
        @c_beef = Dish.new("Chilli Beef", 12.99)
        @peter_griffin = CustomerOrder.new('07787654321', 'Peter Griffin')
        @menu = Menu.new([@c_beef.present, @s_chicken.present])
      end

      def add_dishes_to_menus
        @menu.add(@lobser_t, @fruit_b, @eggs_b, @salad_n)
      end

      def print_the_menu
        @menu.print_list
      end

      def remove_some_dishes_from_the_menu
        @menu.remove(@fruit_b, @eggs_b)
      end

      def add_dishes_to_customer_order
        @peter_griffin.add(@salad_n, @lobser_t)
      end

      def update_the_order
        @peter_griffin.process
      end

      def customer_verifies_their_total
        @peter_griffin.cross_check_total
      end

      def add_more_dishes_to_customer_order
        @peter_griffin.add(@lobser_t, @s_chicken, @c_beef)
      end

      def send_a_text_confirmation
        #@peter_griffin.complete_and_send_text
      end

end
