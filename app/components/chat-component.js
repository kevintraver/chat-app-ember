import Component from '@ember/component';
import ENV from '../config/environment';


export default Ember.Component.extend({
    cableService: Ember.inject.service('cable'),
    session: Ember.inject.service('session'),
    store: Ember.inject.service(),

    didInsertElement: function () {
      this.get('store').query('user', {filter: {'online': 'true'}}).then((results) => {
        this.set('users', results);
      })
    },
  
    messages: [],
    content: 'message',
  
    setupSubscription: Ember.on('init', function() {
      var consumer = this.get('cableService').createConsumer(`ws:/${ENV.APP.websocketsHost}:${ENV.APP.websocketsPort}//websockets`);

      var messagesSubscription = consumer.subscriptions.create("MessagesChannel", {
        received: (data) => {
          if (data.chatroom_id == this.get('chatroomId')) {
            this.get('messages').pushObject({username: data.user, content: data.message});
          }
        }
      });
  
      const appearanceSubscription = consumer.subscriptions.create({ channel: "AppearanceChannel", username: this.get('session.currentUser')}, {
        received: (data) => {
          console.log(data);
        }
      });

      this.set('messagesSubscription', messagesSubscription);
      this.set('appearanceSubscription', appearanceSubscription);
  
    }),
  
    actions: {
      sendMessage() {
        this.get('messagesSubscription').send({ username: this.get('session.currentUser'), content: this.get('content'), chatroom_id: this.get('chatroomId') });
      }
    }
  });