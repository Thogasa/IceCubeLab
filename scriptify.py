import nbformat
from nbconvert.preprocessors import ExecutePreprocessor
import argparse

parser = argparse.ArgumentParser(
                    prog='Scriptify',
                    description='Runs Jupyter notebook as if they where python scripts.',
                    epilog='Run with filename as argument')
parser.add_argument('filename')

args = parser.parse_args()
filename = args.filename
print(f'scriptifying {args.filename}')
with open(filename) as ff:
    nb_in = nbformat.read(ff, nbformat.NO_CONVERT)
    
ep = ExecutePreprocessor(timeout=600, kernel_name='python3')

nb_out = ep.preprocess(nb_in)
