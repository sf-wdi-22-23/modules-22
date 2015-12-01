![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Angular $http in isolation

In this lesson we will review the Angular `$http` service and look at some different ways to write the code. For the sake of simplicity, we will begin with a simple client-side Angular app and a separate API built in Express.

The purpose is to get more experience with Angular's `$http` service and get comfortable troubleshooting and debugging.

```diff
Please Note: The following notation for `$http.get()` has been deprecated:
- $http.get('URL').success(function(){...}).error(function(){...});

Please use this approach, instead:
+ http.get('URL').then(function successCallback(response){...}, function errorCallback(resonse){...});

```
[Details here.](https://docs.angularjs.org/api/ng/service/$http#deprecation-notice)

### In-class demo with Presidents of the US

Instructor demonstrates the process.

### Student work

Repeat the process on your own with the Infamous Criminals project. (Same, but different!)

#### Setup:

1. Clone [this repo](https://github.com/sf-wdi-22-23/angular-http-lab)
1. `cd angular-http-lab/starter-code/api`
1. `npm install`
1. In separate tabs run `mongod` and `npm start` (or `nodemon`).
1. You can monitor your dbs in `mongo` shell or at `localhost:3000/criminals/`
1. Open `angular-http-lesson/sarter-code/frontend/index.html` from your filesystem. (You do not need to run a server for this to work.)

#### Challenges:

1. Build the HTML template and form in `index.html`
1. Pay special attention to the `<form>` and `<ul>` tags.
1. Wire everything up locally and make sure it works. Here are some handy commands for the `mongo` shell:

```bash
show dbs
use infamous-masterminds
show collections
db.criminals.find()

```

## Angular $http in the MEAN stack
#### (for the ridiculously ambitious)

## Setup:

1. Clone [this repo](https://github.com/sf-wdi-22-23/mean-stack-starter)
1. `cd mean-stack-starter`
1. `npm install`
1. `npm start`

## Stretch Challenges:
#### (not for the squeamish)

1. Carefully integrate the content of your `public` folder with the contents from the Criminals project `frontend` folder
1. Carefully integrate the contents of the `app` folder with the corresponding contents from your project's `api` folder
1. There are many conflicts to resolve between `server.js` and `app.js` as well as everything in the `config` folder
1. Troubleshoot, Debug and Solve