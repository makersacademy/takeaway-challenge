Thoughts and issues with the Challenge
=========

From the get go I've had a lot of problems with this challenge.

The biggest problem I've found so far is that I think domain mapping is almost the opposite of rspec testing, or at least writing rspec.

If your domain model is too good at the beginning of the project, for someone not used to writing rspec tests it makes it really difficult.

E.g. When I approached this I thought of a TakeAway class that would store a menu as an array of items and would have a way of returning those items. That's relatively easy to write a test for. When I domain modelled it I realised that Menu should be it's own class which is instantiated within TakeAway. This made the process of thinking about the tests really difficult.
