# Nagios development container

Nagios container to be used during nagios checks/plugin development.

## Setup

Pull the image from docker hub:

```
$ docker  pull odranoel/nagios-dev:latest
```

Build it yourself:

```
$ docker build -t nagios-dev:latest .
```


## Usage

### Volumes mounted:

* `/opt/nagios/custom-plugins`: custom plugin files
* `/var/nagios/logs`: both log an debug files
* `/etc/nagios/cfg`: all nagios definition sub folders (commands, contacts, etc)
* `/opt/setup-scripts`: optional folder that will run all executable files within it

Sample command: 

```
docker run -it \
-v $(shell pwd)/samples:/etc/nagios/cfg \
-v $(shell pwd)/logs:/var/nagios/logs \
-v $(shell pwd)/custom-plugins:/opt/nagios/custom-plugins \
-v $(shell pwd)/setup-scripts:/opt/setup-scripts \
-p 8080:80 $(IMAGE):$(TAG)

```


## License

Copyright 2018 Leonardo Rossetti <me@lrossetti.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
