# Cloudyskies

Simple Web App that uses the DarkSky API to get a weather report on the last seven days:

  * When running in a docker container, the following envirment variables must bet set
    - PORT, MIX_ENV=prod, DARKSKY_API_KEY
  * Built with Phoenix web framework
    - http://www.phoenixframework.org/
  * Powered by DarkSky
    - https://darksky.net/dev 

## Setting up the developement environment

On linux (Ubuntu is assumed), run the following commands to set up elixir and phoenix:

```sh
sudo apt-get install erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install elixir
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
```

## Cloning the repo, dependencies, and build

```sh
git clone git://github.com/grubertw/cloudyskies
cd cloudyskies
mix deps.get
mix compile
```

## Running the WebApp

If MIX_ENV is not set, the app runs in developement mode, which defaults to port 4000. the default production port is 80, but can he changed with the PORT envirnent variable. DARKSKY_API_KEY must also be set, which is a private key you must obtain on your own (simplally create a free dev account on darksky.net).

```sh
export MIX_ENV=prod
export DARKSKY_API_KEY=xxx
mix phx.server
```