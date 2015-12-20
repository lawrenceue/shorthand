Meteor.methods
  'insertSub': (a, c, b) ->
     if Subs.findOne(user: b)
       x = Subs.findOne(user: b)
       console.log(x)
     return
