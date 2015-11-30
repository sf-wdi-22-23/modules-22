# Intro To UI-Router

[UI-Router](https://github.com/angular-ui/ui-router) is a third party module for handling angular routes, and it is very powerful! We are teaching `ui-router` instead of the native `ng-route` for several reasons, including:

1. `ui-router` allows for nested views and multiple named views. This is very useful with larger apps where you may have pages that inherit from other sections.
2. `ui-router` allows for you to have strong-type linking between states based on state names. Changing the url in one place will update every link to that state when you build your links with `ui-sref`. Very useful for larger projects where URLs might change.
3. There is also the concept of the decorator which could be used to allow your routes to be dynamically created based on the URL that is trying to be accessed. This could mean that you will not need to specify all of your routes/states before hand.
4. states allow you to map and access different information about different states and you can easily pass information between states via `$stateParams`.
5. You can easily determine if you are in a state or parent of a state to adjust UI element (highlighting the navigation of the current state) within your templates via the `$state` service provided by `ui-router` which you can expose by setting it in `$rootScope` on run.

In essence, `ui-router` is `ngRouter` with more features but under the sheets it is quite different. These additional features are very useful for larger applications.

For your homework tonight, take some time getting familiar with ui-router to prepare for tomorrows lecture on the subject, using the following resources:

[Egghead.io](https://egghead.io/lessons/angularjs-introduction-ui-router)

[UI-Router Wiki](https://github.com/angular-ui/ui-router/wiki)

[UI-Router FAQ](https://github.com/angular-ui/ui-router/wiki/Frequently-Asked-Questions)

Take a look at [this basic sample app](http://angular-ui.github.io/ui-router/sample/#/) using UI-Router

## Deliverables:

Come up with at least two questions about Angular or ui-router to bring to class tomorrow. If your question isn't answered in lecture, ask your classmates, the DIRs, or your instructors by the end of the day.
When you have your answer, share the question and answer on your Strictly Business Slack. 
