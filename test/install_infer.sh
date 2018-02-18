#!/bin/bash

set -ev

# Install Opaml
wget https://github.com/ocaml/opam/releases/download/1.2.2/opam-1.2.2-x86_64-Linux -O /usr/bin/opam
chmod ugo+x /usr/bin/opam
opam init --yes --comp=4.01.0 #(then say 'y' to the final question)
eval `./opam config env`
opam install --yes sawja.1.5 atdgen.1.5.0 javalib.2.3a extlib.1.5.4 #(then say 'y' to the question)

# Install infer (latest version)
git clone https://github.com/facebook/infer.git
cd infer/
./build-infer.sh
make install
export PATH=`pwd`/infer/bin:$PATH
cd ../
