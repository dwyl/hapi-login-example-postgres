# Hapi Register + Login Example (*using*) PostgreSQL

A login form using hapi-auth-register, hapi-auth-login &amp; hapi-auth-jwt2 with a PostgreSQL DB

[![Build Status](https://travis-ci.org/dwyl/hapi-login-example-postgres.svg?branch=master)](https://travis-ci.org/dwyl/hapi-login-example-postgres)
[![codecov.io](http://codecov.io/github/dwyl/hapi-login-example-postgres/coverage.svg?branch=master)](http://codecov.io/github/dwyl/hapi-login-example-postgres?branch=master)
[![Code Climate](https://codeclimate.com/github/dwyl/hapi-login-example-postgres/badges/gpa.svg)](https://codeclimate.com/github/dwyl/hapi-login-example-postgres)
[![Dependency Status](https://david-dm.org/dwyl/hapi-login-example-postgres.svg)](https://david-dm.org/dwyl/hapi-login-example-postgres)
[![devDependencies Status](https://david-dm.org/dwyl/hapi-login-example-postgres/dev-status.svg)](https://david-dm.org/dwyl/hapi-login-example-postgres?type=dev)
[![HitCount](https://hits.dwyl.com/dwyl/hapi-login-example-postgres.svg?style=flat-square)](https://hits.dwyl.com/dwyl/hapi-login-example-postgres)

## Why?

We did not *find* an ***end-to-end*** solution/tutorial
for ***login*** (*using email & password*) in Hapi.js apps,
so we *wrote* it.

By [***popular demand***](https://github.com/dwyl/hapi-register/issues/7#issuecomment-191713445)
this example *focusses* on ***PostgreSQL***,  
but it can *easily* be adapted to work with *any* backed/database.

If ***anything*** is ***unclear*** in this (*or any of our other repos*),
***please tell us***:
[![Join the chat at https://gitter.im/dwyl/chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dwyl/chat/)  



## What?

This repo is a *showcase* for how to build a login flow using Hapi.js.  
We use the following plugins:
+ [**hapi-register**](https://github.com/dwyl/hapi-register)
+ [**hapi-login**](https://github.com/dwyl/hapi-login)
+ [**hapi-postgres-connection**](https://github.com/dwyl/hapi-postgres-connection)
+ [**hapi-auth-jwt2**](https://github.com/dwyl/hapi-auth-jwt2)

Each one is *hand-crafted*, *tested* and *maintained* by [*us*](https://github.com/dwyl),
feel free to use the code how ever you see fit.

> Note: If you have requests/suggestions for how to *extend* this example,
[*please let us know!*](https://github.com/dwyl/hapi-login-example-postgres)

### Highlights:

+ ALL values inserted into the database are *escaped* using
[`pg-escape`](https://github.com/segmentio/pg-escape)
(*made by [@TJ](https://github.com/tj) & Co ... so you know its good*)
+ We use [`Joi`](https://github.com/hapijs/joi) for validation - which
we display in the client UI. (*see screenshots below*)

## Try it: https://hapi-login.herokuapp.com/

![login form](https://cloud.githubusercontent.com/assets/194400/10523082/6e7fab3c-7370-11e5-91e2-639fc725b3e6.png)

## How?

The best way to get started is to run this example *locally*.

> Please ***ensure*** you have ***PostgreSQL Installed and Running*** on your local machine
***before*** you attempt to run this example.
> see: https://wiki.postgresql.org/wiki/Detailed_installation_guides

#### 1. Clone the repo:

```sh
git clone https://github.com/dwyl/hapi-login-example-postgres.git
cd hapi-login-example-postgres
```
#### 2. Install *Dependencies* from NPM

```sh
npm install
```

#### 3. Ensure you have the Required Environment Variables

create an `.env` file in your `hapi-login-example-postgres` directory.
add a line for your `DATABASE_URL` variable and one for `JWT_SECRET`:
e.g:
```sh
export DATABASE_URL=postgres://postgres:@localhost/test
export JWT_SECRET=https://git.io/vaN7A
```
> default on mac is: export DATABASE_URL=postgres://postgres:@localhost/test  
> if you don't *already* have a database called `test` on your system,  
> create it now by running this command in your psql/pgadmin: `CREATE DATABASE test;`

#### 4. Run the Tests

```sh
npm test
```

**Note**: running `npm test` will first execute `npm run create` which creates
the necessary Database Tables to run the app. see:
[/test/database_setup.sql](https://github.com/dwyl/hapi-login-example-postgres/blob/master/test/database_setup.sql)

#### 5. Run the Server

```sh
npm run dev
```

That's it.  
Now, ~~hack~~ *customise* it to your heart's content!

### Demo Screenshots

When you visit http://localhost:8000/ you will see a login form, you can login with any valid email address:
![hapi-login-01](https://cloud.githubusercontent.com/assets/194400/10522464/312648ca-736d-11e5-9f9f-36e39755b186.png)

Make sure the email address is valid:
![hapi-login-03](https://cloud.githubusercontent.com/assets/194400/10522488/47a24568-736d-11e5-8f3b-47a08699b09a.png)

Your password needs to be more than 6 characters long:
![hapi-login-05](https://cloud.githubusercontent.com/assets/194400/10522520/78b44052-736d-11e5-919f-903270075795.png)

We also use https://github.com/chriso/validator.js
to mitigate [Cross Site Scripting](https://en.wikipedia.org/wiki/Cross-site_scripting)
vulnerability:

Avoids Cross Site Scripting:
![hapi login avoids XSS](https://cloud.githubusercontent.com/assets/194400/10522594/db57b45a-736d-11e5-969a-844d186db80b.png)


## Want *More*?

If you would like to see this example *expanded*,
please either [***create an issue***](https://github.com/dwyl/hapi-login-example-postgres/issues)
with a *specific request* or [![Join the chat at https://gitter.im/dwyl/chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dwyl/chat/)
