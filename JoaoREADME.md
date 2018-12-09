I would have liked to have made a seperate display class for showing the menu and displaying any text. These would then call Order class methods or Menu class methods into action. For example rather than just displaying the hash I would have liked a feature that took the key and value objects and interpolated them into a nicer, more menu-like format. E.g.

Converting the hash from:

"Peroni => 4.50"

using:

"#{key}........£#{value}"

would become:

"Peroni........£4.50"


This looks more like an actual menu.

I also think that the #input_to_add method should have been shortened, with the order array access and retrieval called in one method and the outcome of the retrieval (adding single or multiples of entry) in another.

I was keen to get onto using Twilio and was worried about time so did not do these.