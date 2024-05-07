all: build/temp


build/training_data.csv: build FeatureSelection.ipynb scriptify.py
	python scriptify.py FeatureSelection.ipynb


build/BdtClassified.txt: build scriptify.py build/training_data.csv BoostedDecisionTree.ipynb
	python scriptify.py BoostedDecisionTree.ipynb

build/temp: build/BdtClassified.txt
	mkdir build/temp

build:
	mkdir -p build

clean:
	rm -rf build

FORCE:

.PHONY: all clean
