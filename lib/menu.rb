class Menu

    attr_reader :dishes

    def initialize
        @dishes = {"Deep fried bacon mac 'n' blue cheese herb mayonnaise" => 4,
            "Flatbread aubergine pickle, harissa, dukkah, yoghurt" => 4,
            "Oxtail nuggets mushroom ketchup" => 5,
            "Beerkins sriracha mayo" => 4,
            "Dripping chips" => 3,
            "Falafel flatbread, tahini, tomato & cucumber salad, zhoug, beetroot and turnip pickle" => 7,
            "Pork schnitzel bone marrow mash, pickled red cabbage, pork gravy, wholegrain mustard mayo, apple ketchup" => 8,
            "Chilli dog brioche roll, hot dog, beef & chipotle chilli, nacho cheese sauce, crispy shallots, red onion & jalapeno salsa, sour cream" => 7,
            "Potato rosti cheesy leeks, gruyere, fried egg, onion rings, gochujang sauce" => 8,
            "Dizzy burger beef paty, brioch bun, bacon mayo, swiss cheese, tomato jam, baby gem, served with chips" => 9}
          
    end

    def print
       @dishes.each do |item, price|
          print "Item: #{item}. Price: £#{price}"
       end
    end



end