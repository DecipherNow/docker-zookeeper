# deciphernow/zookeeper

This repository contains the resources for building the deciphernow/zookeeper image. This image is geared towards both local development and deployment in containerized infrastructure such as Kubernetes.  Further, it follows RedHat's best practices making it suitable for deployment within OpenShift without any elevated priviledges.

## Usage

This image is configured to run in a single instance deployment out of the box. However, if you wish to deploy an ensemble or further tailor the parameters the following configuration values are exposed as environment variables:

| Variable   | Example        | Default   | Description                                            |
|------------|----------------|-----------|--------------------------------------------------------|
| INIT_LIMIT | 10             | 10        | The number of ticks the server has to join the quorum. |
| LOG_LEVEL  | INFO           | INFO      | The log level for the server.                          |
| SERVER     | zk01           | localhost | The hostname of the server.                            |
| SERVERS    | zk01,zk02,zk03 | localhost | The hostname of all servers in the quorum.             |
| SYNC_LIMIT | 5              | 5         | The number of ticks before a server leaves the quorum. |
| TICK_TIME  | 2000           | 2000      | The number of milliseconds in a tick.                  |   

## Development

This repository is pretty simple and everything you want to know can be seen in the [Makefile](./Makefile).

### Prerequisites

In order to develop and test with this repository you will need the following installed:

    - docker
    - git
    - make

### Building

To build the image run the following command:

```sh
make build
```

To publish the image run the following command:

```sh
make publish
```

### Versioning

The version of this image tracks directly with the version of ZooKeeper built.  In order to update the version of ZooKeeper modify the [VERSION](./VERSION) file with the version needed. 

## Contributing

In general, we follow the "fork-and-pull" Git workflow.

1. Clone the project to your own machine.)
1. Commit changes to your own branch.
1. Push your work back up to your fork.
1. Submit a pull request so that we can review your changes.

NOTE: Be sure to fetch and rebase on the upstream master before making a pull request.

