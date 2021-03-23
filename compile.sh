#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage: ./compile <module name>"
    exit 0
fi

if ! hash ocamlbuild 2>/dev/null ; then
    echo "ocamlbuild not installed"
    exit 0
fi

if ! hash pcregrep 2>/dev/null ; then
    echo "pcregrep not installed"
    exit 0
fi

# Grab packages from .merlin
if [ -f ".merlin" ] ; then
    PKGS=$(pcregrep -o1 'PKG ([a-z]*)' .merlin)
fi

for pkg in $PKGS ; do
    if [ -z "$PACKAGES" ] ; then
        PACKAGES=$pkg
    else
        PACKAGES=$PACKAGES,$pkg
    fi
done

if [ ! -z "$PACKAGES" ] ; then
    PKG_STRING="-pkgs $PACKAGES"
fi

OCAMLBUILD="ocamlbuild -use-ocamlfind $PKG_STRING src/$1.native"

echo "Running $OCAMLBUILD"
$OCAMLBUILD
rm $1.native
