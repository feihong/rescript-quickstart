clean:
	rm  dist/*; yarn rescript clean

start:
	(trap 'kill 0' SIGINT; yarn rescript build -w & yarn dev)
