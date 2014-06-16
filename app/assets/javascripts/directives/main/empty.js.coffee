# angular.directive "TypingTrainer, ngEnter", ->
#   (scope, element, attrs) ->
#     element.bind "keydown keypress", (event) ->
#       if event.which is 13
#         scope.$apply ->
#           scope.$eval attrs.ngEnter
#           return
#         event.preventDefault()