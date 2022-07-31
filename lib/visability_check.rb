# this is just a file I used to see visability of some of the outputs
food = { "margharita" => 8.99,
    "hawian" => 9.99,
    "peporonni" => 9.99
    }
selection = "hawian"
p food.include?(selection)
p food

delivery_time = (Time.now + 3600)
p delivery_time.strftime("%I:%M %p")
