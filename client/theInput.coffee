Template.theInput.events
  'change #theInput': (event, template) -> 
   x = template.find('#theInput').value
   a = Subs.findOne({user: Meteor.userId()})
   y = x.split(/(\s|\n|\t)/g).map (x) ->
       replacer(x, a)
   template.find("#theOutput").value = y.join('')
   return
  'click #replacementAdd': (event, template) ->
   shorthand = template.find('#theShorthand').value.toString()
   replacement = template.find('#theReplacement').value.toString()
   if Meteor.userId()
      Meteor.call('insertSub', shorthand, replacement, Meteor.userId())
   template.find('#theShorthand').value = ''
   template.find('#theReplacement').value = ''

replacer = (str, obj, arr) ->
  newStr = str
  newStr = obj[newStr] if newStr.toLowerCase() in Object.keys(obj)
  newStr

Meteor.subscribe('theSubs')
