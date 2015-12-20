Meteor.publish('theSubs', ->
  x = @userId.toString()
  Subs.find({user: x})
)

# publishes only the record belonging to the logged in user as 'theSubs', which is subscribed to by the client side
