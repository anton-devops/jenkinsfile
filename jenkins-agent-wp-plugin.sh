#!/bin/bash

echo 46039ea47beb8df7eba62fe1797b734530000e68b59659fcdd9d69aa0c99bdfa > secret-file
java -jar agent.jar -jnlpUrl http://ip172-18-0-124-c36908vnjsv000e5hhk0-8080.direct.labs.play-with-docker.com/computer/test/jenkins-agent.jnlp -secret @secret-file -workDir "/home/ubuntu/"

