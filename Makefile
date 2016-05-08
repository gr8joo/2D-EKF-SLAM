CC = g++
CFLAGS = -fPIC -I/usr/local/Aria/include -L/usr/local/Aria/lib -lAria -lpthread -ldl -lrt -std=c++11

OUTPATH = ./build
MAINOUT = wander

MAININ = wander.cpp
ODOMIN = odometry/kalmanfilter.cpp odometry/Propagate.cpp odometry/Update.cpp
MOVEIN = movement/movementcontroller.cpp
FEATIN = features/houghtransform.cpp features/featuredetector.cpp

all: wander

wander: $(MAININ) $(ODOMIN) $(MOVEIN) $(FEATIN)
	mkdir -p $(OUTPATH)
	$(CC) -o $(OUTPATH)/$(MAINOUT) $(MOVEIN) $(FEATIN) $(ODOMIN) $(MAININ) $(CFLAGS)

clean:
	rm -rf $(OUTPATH)/$(MAINOUT)
	rm -rf $(OUTPATH)
