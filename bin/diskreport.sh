#!/bin/bash

dir=${1:-.}

du "${dir}" | sort -nr 
