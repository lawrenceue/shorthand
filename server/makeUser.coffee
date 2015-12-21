Accounts.onCreateUser (options, user) ->
  x = {user: user._id}
  Subs.insert(x)
  user
