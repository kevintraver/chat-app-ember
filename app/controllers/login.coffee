import Ember from 'ember'

export default Ember.Controller.extend
  session: Ember.inject.service('session')
  actions:
    login: (username) ->
      this.get('session').set('currentUser', username)
      this.transitionToRoute('chatrooms')