#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Error: Missing input file name"
	echo "Usage: $0 [-e file_to_encode] [-d file_to_decode]"
	exit 1
fi
case "$1" in
	-d)
		echo "Decoder" | figlet
		
		cat "$2" | rot13 | base64 -d | base32 -d | base58 -d > "$2".dec
		
		echo "Completed!"
	;;
	-e)
		echo "Encoder" | figlet
		sleep 1
		cat "$2" | base58 | base32 | base64 | rot13 > "$2".enc
		echo "Completed!"
	;;
	-h)
		echo "Usage: $0 [-e] [-d] <file>"
		echo "  -e      Encode the file"
		echo "  -d      Decode the file"
		echo "  -h      Help (this message)"
		exit 0
	;;
	*)
		echo "Error: Invalid option or argument"
		echo "Usage: $0 [-e]{Encode} [-d]{Decode} <file>"
		exit 1
esac
