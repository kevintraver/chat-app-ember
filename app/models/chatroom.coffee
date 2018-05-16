import DS from 'ember-data'

export default DS.Model.extend {
  topic: DS.attr 'string'
  users: DS.hasMany 'user'
  messages: DS.hasMany 'message'
}
