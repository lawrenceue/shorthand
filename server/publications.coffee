Meteor.publish('theSubs', ->
  x = @userId.toString()
  Subs.find({user: x})
)
