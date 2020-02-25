# sea
sea is a package manager written in POSIX shell script for POSIX shell scripts.

## Installation
To install sea, just use the install script.

```
$ git clone https://github.com/h34ting4ppliance/sea.git
# install.sh
```

## Managing packages

### Install a package

From the repos
```
sea i package
```

### Remove a package

```
sea r package
```

### Query packages

Query all packages
```
sea q
```

Query one package
```
sea q package
```

Query packages based on a tag
```
sea q -t "util"
```

### Submit packages

```
sea s package.tar.gz
```
