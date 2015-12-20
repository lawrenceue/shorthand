Meteor.publish('theSubs', ->
   Subs.findOne({user: this.userId})
)
