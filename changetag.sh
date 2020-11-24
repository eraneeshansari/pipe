#!/bin/bash
sed "s/tagVersion/$1/g" mypod.yaml > pod.yaml
