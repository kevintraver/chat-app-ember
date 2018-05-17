import Ember from 'ember'
import { isEqual } from '@ember/utils';
import EmberObject, { computed } from '@ember/object';

export default Ember.Component.extend
    session: Ember.inject.service('session'),

    classNames: ['uk-grid-small','uk-padding-large']
    classNameBindings: ['isMyMessage:my-message:uk-flex-right']
    tagName: 'div'
    attributeBindings: ['uk-grid']
    'uk-grid': ''

    isMyMessage: computed('message', ->
      isEqual(@get('message.username'),@get('session.currentUser') );
    )
