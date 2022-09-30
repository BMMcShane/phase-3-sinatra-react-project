## FarmLand 🌱🌿🌵☘️🌳

## Introduction 


Our app is a fun and interactive pixelated game where a user can use an in game currency to buy seeds and plant them. Users will be able to earn more currency by harvesting the plants that they grow,  and from being active. A user can also use their currency to upgrade their farm and upgrade plant functions.

## Wireframe




## Wants

- [ ] Time based -- Takes current time vs last time accessed to determine passage of time and/or crop saves a login timestamp

- [ ] Save locally/have a login -- find a way to make login persist to cut down on time to access

- [ ] Gameboy Advanced style Graphics -- Pixel Art

- [ ] Different Crops -- with different yields and grow time

- [ ] Farm Upgrading -- faster harvest times

- [ ] Spendable Currency -- establish initial amount and recurring return for harvests

- [ ] Change image of plant based off growth percentage -- visual change with pixel art

- [ ] Tailwind for CSS -- utilizing new tools to build frontend display

- [ ] Progressively Alien Plants -- mutations and/ or exotic plant upgrades

- [ ] Activity -- monitors user activity and how often they are using the app

---------------------------------------------------------------------------------------------


## Learning Goals

- Build a web basic API with Sinatra and Active Record to support a React
  frontend

## Introduction

Congrats on getting through all the material for Phase 3! Now's the time to put
it all together and build something from scratch to reinforce what you know and
expand your horizons.

The focus of this project is **building a Sinatra API backend** that uses
**Active Record** to access and persist data in a database, which will be used
by a separate **React frontend** that interacts with the database via the API.

## Requirements

For this project, you must:

- Use Active Record to interact with a database.
- Have at least two models with a one-to-many relationship.
- At a minimum, set up the following API routes in Sinatra:
  - create and read actions for both models
  - full CRUD capability for one of the models
- Build a separate React frontend application that interacts with the API to
  perform CRUD actions.
- Use good OO design patterns. You should have separate classes for each of your
  models, and create instance and class methods as necessary.

## Getting Started

### Backend Setup


You can start your server with:

```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).

### Frontend Setup

Your backend and your frontend should be in **two different repositories**.

Create a new repository in a **separate folder** with a React app for your
frontend. To do this, `cd` out of the backend project directory, and use
[create-react-app][] to generate the necessary code for your React frontend:

```console
$ npx create-react-app my-app-frontend
```

After creating the project locally, you should also
[create a repository on GitHub][create repo] to host your repo and help
collaborate, if you're working with a partner.

### Fetch Example

Your React app should make fetch requests to your Sinatra backend! Here's an
example:

```js
fetch("http://localhost:9292/test")
  .then((r) => r.json())
  .then((data) => console.log(data));
```

## Project Tips

- Once you have a project idea, come up with a domain model and decide what
  relationships exist between the models in your application. Use a tool like
  [dbdiagram.io][] to help visualize your models.
- Decide on your API endpoints. What data should they return? What kind of CRUD
  action should they perform? What data do they need from the client?
- Use [Postman][postman download] to test your endpoints.
- Use `binding.pry` to debug your requests on the server. It's very helpful to use a
  `binding.pry` in your controller within a route to see what `params` are being
  sent.
- Use the [Network Tab in the Dev Tools][network tab] in the frontend to debug
  your requests.

## Resources

- [create-react-app][]
- [dbdiagram.io][]
- [Postman][postman download]

[create-react-app]: https://create-react-app.dev/docs/getting-started
[create repo]: https://docs.github.com/en/get-started/quickstart/create-a-repo
[dbdiagram.io]: https://dbdiagram.io/
[postman download]: https://www.postman.com/downloads/
[network tab]: https://developer.chrome.com/docs/devtools/network/
