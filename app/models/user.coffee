import DS from 'ember-data'

export default DS.Model.extend {
  username: DS.attr 'string'
  users: DS.hasMany 'user'
  online: DS.attr 'boolean'
  chatrooms: DS.hasMany 'chatroom'
}
