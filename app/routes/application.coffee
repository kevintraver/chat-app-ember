import Ember from 'ember'

export default Ember.Route.extend
  session: Ember.inject.service('')

  beforeModel: ->
    if Ember.isEmpty(@get('session').get('currentUser'))
      @transitionTo('login')