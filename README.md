# Feihong's ReScript quickstart

## Prerequisites

    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    nvm install 14
    nvm use 14

## Installation

    yarn install

## Commands

Start Parcel and ReScript compiler in watch mode:

    yarn start

## Notes

Running Parcel and ReScript in watch mode using npm-run-all doesn't work very well. It can't be interrupted using ctrl+c on Linux, and sometimes even fails on Mac too.

Vite doesn't seem to have much more configuration than Parcel does.

## Links

- [Integrate Into an Existing JS Project](https://rescript-lang.org/docs/manual/latest/installation#integrate-into-an-existing-js-project)
