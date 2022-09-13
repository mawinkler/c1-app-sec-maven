# Cloud One Application Security with Maven Projects

- [Cloud One Application Security with Maven Projects](#cloud-one-application-security-with-maven-projects)
  - [Usage](#usage)
  - [Support](#support)
  - [Contribute](#contribute)

This demo app for Cloud One Application Security uses Maven to build a SpringBoot application in Docker.

Application Security integration done via the provided Dockerfile

## Usage

First, clone the repo

```sh
$ git clone https://github.com/mawinkler/c1-app-sec-maven.git
```

Build

```sh
$ docker build -t demo .
```

Run

```sh
$ docker run \
    --rm \
    -p 8080:8080 \
    -e TREND_AP_KEY=<APP SEC GROUP KEY> \
    -e TREND_AP_SECRET=<APP SEC GROUP SECRET> \
    demo:latest
```

Demo Shellshock (ensure to have `Malicious Payload` enabled within the Application Security policy).

```sh
curl -H "User-Agent: () { :; }; /bin/eject" http://localhost:8080/
```

## Support

This is an Open Source community project. Project contributors may be able to help, depending on their time and availability. Please be specific about what you're trying to do, your system, and steps to reproduce the problem.

For bug reports or feature requests, please [open an issue](../../issues). You are welcome to [contribute](#contribute).

Official support from Trend Micro is not available. Individual contributors may be Trend Micro employees, but are not official support.

## Contribute

I do accept contributions from the community. To submit changes:

1. Fork this repository.
1. Create a new feature branch.
1. Make your changes.
1. Submit a pull request with an explanation of your changes or additions.

I will review and work with you to release the code.
