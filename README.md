### Takeaway Challenge

## Note to reviewer
I think the ```Order``` class may be breaking the single responsibility principal since it deals with selecting dishes to add to the order and also calculating the total of the order and checking this against the user's given total. This would be interesting discussion point. 

## Approach
I took a methodical approach to this challenge using TDD.

The steps I would take for each user story:

1. RED - Write a feature test in  ```spec/features/user_stories_spec.rb``` based on the user story given. See it fail, and then write a unit test for the relevant class to fail with the same error message.

2. GREEN - Make the feature test and unit test pass.

3. Refactor. Write further unit tests as necessary to comply with the user stories requirements and repeat RED-GREEN-REFACTOR for these tests

4. Repeat 1 to 3 for each user story.  
