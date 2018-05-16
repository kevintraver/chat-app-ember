import EmberRouter from '@ember/routing/router'
import config from './config/environment'

Router = EmberRouter.extend
  location: config.locationType
  rootURL: config.rootURL

Router.map

`export default Router;`