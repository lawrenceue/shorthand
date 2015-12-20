Template.theInput.events
  'change #theInput': (event, template) -> 
   x = template.find('#theInput').value
   y = x.split(/(\s|\n)/g).map (x) ->
       replacer(x, Subs.findOne({user: Meteor.userId()}))
   template.find("#theOutput").value = y.join('')
   return
  'click #replacementAdd': (event, template) ->
   shorthand = template.find('#theShorthand').value
   replacement = template.find('#theReplacement').value
   if Meteor.userId()
      Meteor.call('insertSub', shorthand, replacement, Meteor.userId())
   template.find('#theShorthand').value = ''
   template.find('#theReplacement').value = ''

replacer = (str, obj, arr) ->
  newStr = str
  newStr = obj[newStr] if newStr in Object.keys(obj)
  newStr

Meteor.subscribe('theSubs')
