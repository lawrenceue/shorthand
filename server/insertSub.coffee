Meteor.methods
  'insertSub': (a, c, b) ->
     if Subs.findOne(user: b)
       x = Subs.findOne(user: b)
       x[a]=c
       Subs.update({user: b}, x)
     else
       x = {}
       x["user"] = b
       x[a] = c
       Subs.insert(x)
     return
