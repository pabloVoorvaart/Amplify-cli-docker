

# Docker JS dev enviroment

This repo contains a set of instructions to get a AWS Amplfiy + react enviroment ready in minutes thanks to Docker.

### Initial config

We will need to set up our AWS credentials so that we can fetch them to the AWS and amplify CLIs. 

We need this folder structure in the root of user filesystem.

.aws/
  credentials
  config

.amplfiy/
  (empty folder)


### Building the CLIs

##### AWS CLI
Follow the official docs to build and run the official CLI as a docker container.

[Link to docs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-docker.html)

Dont forget to create an alias: 

`alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'`


##### Amplify CLI

For Amplify, we will need to build the image off the dockerfile contained in this repository.

- Clone repo.
- Build: `docker build -t amplify-cli .`
- Now we can create an alias:

`alias amplify='docker run --rm -tiv $HOME/.aws:/root/.aws -v $HOME/.amplify:/root/.amplify -v $(pwd):/opt/node/app/src amplify-cli amplify'`

- Finally we can run the cli inside our proyect folder.

### Node and npm

Using docker compose, we can spin up a container with node and and all of the proyect dependencies installed. The container will have port 3000 open since our dev server will live there.

Simpliy clone the repo, change *{proyect-name}* placeholder to your proyects name, and run this command: 

`docker-compose up`


### Notes

- Tested on Apple silicon.
- Debian base distributions should have no trouble running this setup.

