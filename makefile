all: build/temp


build/training_data.csv: build FeatureSelection.ipynb scriptify.py
	python scriptify.py FeatureSelection.ipynb


build/BDTRoc.txt: build scriptify.py build/training_data.csv BoostedDecisionTree.ipynb
	python scriptify.py BoostedDecisionTree.ipynb
	
build/KNNRoc.txt: build scriptify.py build/training_data.csv KNN.ipynb
	python scriptify.py KNN.ipynb
	
build/GNBRoc.txt: build scriptify.py build/training_data.csv NaiveBayesian.ipynb
	python scriptify.py NaiveBayesian.ipynb
	


build/compareFB.pdf: build scriptify.py build/KNNRoc.txt build/BDTRoc.txt build/GNBRoc.txt
	python scriptify.py compare.ipynb

build/temp: build/compareFB.pdf
	mkdir build/temp



build:
	mkdir -p build

clean:
	rm -rf build

FORCE:

.PHONY: all clean
