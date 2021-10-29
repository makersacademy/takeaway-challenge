#### takeaway-challenge-python

## installation
```
pip install bm_takeaway_makers
```
## issues & improvements
In some areas the code follows the principle of encapsultation and separation of
concern quite well. There are one or two areas I’d like to change however such
as the menu being a class method of Takeaway. It probably doesn’t make sense for
this to be the case as new instances will always have the same menu!

The testing is however not particularly DRY and in some instances not as
well targeted as I would have liked. I wanted to focus on getting a test suite
together and packaging the project, with mocking and doubling and paramaterizing
being future goals to improve the test suite.