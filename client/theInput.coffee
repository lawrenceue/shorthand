Template.theInput.events
  'change #theInput': (event, template) -> 
   x = template.find('#theInput').value
   console.log(x)
   y = x.split(' ').map (x) ->
       replacer(x, obj1)
   console.log(y.join(' '))
   template.find("#theOutput").value = "ABC"
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
