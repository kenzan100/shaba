## What is this?

I'm rewriting my private memo app with more of 'buiding my own web framework' in mind.
Primary purpose is to be more confident about architecture of web apps.

## So far what's going on?

* read through [Hanami (fka Lotus) framework](http://hanamirb.org/)
* extract key domain components from my old spaghetti codebase
* rewrite them with plain Ruby objects
* when I need to implement "business-logic-independent" features to my app, encapsulate them to different modules
* maybe they will become another web framework

## Hanami framework is influenced by [the Clean Architecture](https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html). Is yours, too?

Indeed!
To confirm, you can simply play around with Plain Old Ruby Objects under lib directory to figure out what this application is all about.

```ruby
# assuming you've passed user registration step and you're now a user
your_spaces = SpaceManager.construct_for(user)
memo = Memo.new('your memo')
post = Post.new(memo)
space = your_space.detect{|s| s.type == :draft}
space.add(post)
```
