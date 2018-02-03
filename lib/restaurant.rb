class Restaurant

  def launch!
    introduction
    # action loop
      # what do you want to do? (add, remove etc)
      # do that action
    # repeat until user quits
    conclusion
  end

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

end
