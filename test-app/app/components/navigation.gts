import Component from '@glimmer/component';
import RouterService from '@ember/routing/router-service';
import { service } from '@ember/service';
import { LinkTo } from '@ember/routing';

export default class Navigation extends Component {
  @service declare router: RouterService;

  get routes() {
    const router = this.router;
    const routerMicrolib =
      // eslint-disable-next-line ember/no-private-routing-service
      router._router._routerMicrolib || router._router.router;
    const routes = Object.keys(routerMicrolib.recognizer.names).filter(
      (route) => {
        return (
          !route.includes('loading') &&
          !route.includes('error') &&
          !route.includes('index') &&
          route !== 'components.control' &&
          route !== 'components' &&
          route !== 'application'
        );
      },
    );
    console.log(routes);
    return routes;
  }

  <template>
    <ul>
      {{#each this.routes as |route|}}
        <li>
          <LinkTo @route={{route}}>{{route}}</LinkTo>
        </li>
      {{/each}}
    </ul>
  </template>
}
