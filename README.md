# Jekyll AMP Template

## Setup
1. Install [RVM](https://rvm.io/): `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
2. Install [`bundler`](https://bundler.io/): `gem install bundler`
3. Install [nvm](https://github.com/nvm-sh/nvm): `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash`
4. Install [`yarn`](https://yarnpkg.com/en/): `npm install -g yarn`

## Development

1. `bundle`
2. `yarn`
3. in one window, run `ngrok http 8080`
4. in another, run `yarn start`
5. navigate to http://localhost:8080

## Test

1. `yarn test`

## Lint

1. `yarn lint`
