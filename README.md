```diff
- This repository is only for deploying in Heroku
```
# Portable Streaming Server for Stremio
This docker image allows you to run Stremio's streaming server as a standalone server (i.e. separate from the desktop application). You could drop a streaming server container on a separate linux-based server and remotely connect your Stremio interface to it. Or, you could run this together with Stremio 5 (a.k.a [stremio-web](https://github.com/Stremio/stremio-web), which is currently in **alpha**).

If you're interested in building Stremio components yourself, check out the instructions at the [stremio-shell](https://github.com/Stremio/stremio-shell/) repository.

## Deploying in Heroku
1. Install the Heroku CLI from [here](https://devcenter.heroku.com/articles/heroku-cli)
2. Clone this repository `$ git clone https://github.com/sachinOraon/stremio-streaming-server.git && cd stremio-streaming-server`
3. Login to Heroku `$ heroku login`
4. Create an app `$ heroku apps:create <your-app-name>`
5. Set the stack of your app to `container` `$ heroku stack:set container`
6. Add `heroku` remote to the repository `$ heroku git:remote -a <your-app-name>`
7. Push your app to Heroku `$ git push heroku main`
8. Once the app is successfully deployed, then go to this URL https://app.strem.io/shell-v4.4
9. Login with your credentials and go to Settings.
10. Set `https://your-app-name.herokuapp.com` as the Streaming server URL

## Usage
Execute the following command to pull and run the docker image:

`$ docker run -p 11470:11470 -v ${PWD}:/root/.stremio-server --name=stremio-streaming-server sleeyax/stremio-streaming-server`

This will run the **latest version** of the streaming server, map the configuration directory `.stremio-server/` to your current working directory `${PWD}` and expose it on port `11470`.

### Advanced
Normally the latest version should be fine but if for some reason you'd like to run a different version of the streaming server, follow these steps:
1. Clone this repository `$ git clone https://github.com/sleeyax/stremio-streaming-server && cd stremio-streaming-server`.
2. Change the `VERSION` build argument. For example: `ARG VERSION=v4.4.148`
3. rebuild the container `$ docker build -t sleeyax/stremio-streaming-server .` or `docker buildx build --platform linux/arm64,linux/arm/v7 -t sleeyax/stremio-streaming-server .` for multi-arch builds.

---

**This project is not officialy maintained by Stremio.**
