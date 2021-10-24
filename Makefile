clean:
	rm  dist/*; yarn rescript clean

start:
	(trap 'kill 0' SIGINT; yarn parcel index.html & yarn rescript build -w)
