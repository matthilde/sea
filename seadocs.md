# Sea Documentation
**NOTE: This documentation is not complete due to the actual development stage of sea. Sea is usable but yet uncomplete.**  
**ANOTHER NOTE: Please follow this documentation. DO NOT FOLLOW THE COMMAND USAGE HELP OF SEA. It is not accurate.**

## Introduction
sea is a package manager written in POSIX shell script for shell scripts. The goal of this project is to create a big library of shell scripts which is easy to find and install.

The package manager has been designed to be lightweight, portable, fast and easy to use. This documentation won't be long because you won't need to be a rocket scientist to know how to use it.

## I'm too lazy to read.

This section will be kind of a tl;dr of this whole documentation if you just want to get started quickly and having no needs of knowing more about it.

Let's just say you want to install examplepkg, you just have to do `sea i examplepkg`. If you need to delete it, just do `sea r examplepkg` and if you want to know how many packages you have installed, do `sea q`.

To submit, see the Submission section.

## Basic package management.

Regarding the actual development stage of the package manager, I don't have much to say about basic package management with it for now. Like said in the beginning of the docs, since sea is not done, the documentation is also not done.

There is a few commands to perform basic package management. That means querying, removing and installing packages.

To install packages in your computer through the package manager, do this
```
$ sea i package1 package2 ...
$ sea install package1 package2 ...
```

To remove packages in your computer through the package manager, do this
```
$ sea r package1 package2 ...
$ sea remove package1 package2 ...
```

To locally query packages, do
```
$ sea q
```

The repo query hasn't been implemented yet. To get a list of available packages, you can do it through cURL
```
curl https://sea.h3liu.ml/repo/<category>/
```

To know more about the repos, take a look at the API section.

## Submission/Make packages

The packages have been designed to be easy to make. Without complicated metadata, the package metadata is nothing more than 4 files.

To get an example package, you download examplepkg package and extract it
```
$ curl https://sea.h3liu.ml/repo/main/examplepkg -o examplepkg.tar.gz
$ tar -xf examplepkg.tar.gz
```

The package contains 4 files :
```
manifest     Package manifest, contains version and description
package      The shell script itself
tags         Search tags
depends      Dependencies
```

All the files must exist and if you do not have any required dependencies or tags, then the files must exist but must be left blank.

To submit a package. Your current working directory must be where your package files are (do not make an archive)

Once you are in, do
```
$ sea s <package name>
```

Once done, you will then be given a token. Keep it to update your package. To update a package, repeat the previous manipulation but instead of giving the package name, provide the token like this
```
$ sea s <Token>
```

## Repos API

This is a reference to the simple API of the repos. Knowing about the API will allow you to implement your own version of the sea package manager or the sea repos.

It's going to be really short because there isn't much to say so simple it is.

```
/repo/                   get a list of the repo categories
/repo/foobar/            get a list of packages contained in a category
/repo/foobar/baz         get the baz package contained in the foobar category
/submit/pkgname          submit a package.
/submit/TOKEN            update a package.
```

```
/repo/
/repo/foobar/
```
Those two categories are used to fetch a list of something. /repo/ would list all the categories available and /repo/foobar/ would list the packages available in the foobar category.

```
/repo/foobar/baz
```
This would download the baz package contained in foobar. Even if it doesn't have any file extension, it has to be opened as a tar.gz archive.

```
/submit/pkgname
/submit/TOKEN
```
This would submit a package in the .tar.gz format. To submit one with curl, make a package and submit it like this
```
$ curl -Ffile=@pkgfile.tar.gz https://HOSTNAME/repo/<pkgname/TOKEN>
```

**NOTE: Make sure that the files are in the root of the package. To make sure, use the tar -tf command. The output should look like this**
```
$ tar -tf pkgfile.tar.gz
depends
manifest
package
tags
```
