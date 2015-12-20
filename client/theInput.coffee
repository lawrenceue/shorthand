Template.theInput.events
  'change #theInput': (event, template) -> 
   x = template.find('#theInput').value
   console.log(x)
   y = x.split(' ').map (x) ->
       replacer(x, obj1)
   console.log(y.join(' '))
   console.log(Template.theInput.helpers.axe);
   template.find("#theOutput").value = "ABC"
   return
  'click #replacementAdd': (event, template) ->
   shorthand = template.find('#theShorthand').value
   replacement = template.find('#theReplacement').value
   replacementObj = 
       user : Meteor.userId()
       shorthand : shorthand
       replacement : replacement
   Meteor.call('insertSub', replacementObj)
   template.find('#theShorthand').value = ''
   template.find('#theReplacement').value = ''

obj1 = 
  "a":"z"
  "b":"x"

replacer = (str, obj, arr) ->
  newStr = str
  newStr = obj[newStr] if newStr in Object.keys(obj)
  newStr

arr = ["a","b","c"]
arrx = []
arr2 = arr.map (x) ->
   replacer(x, obj1)
console.log(arr2)

if Meteor.userId()
  Meteor.call('insertSub')
  Meteor.subscribe('theSubs')
