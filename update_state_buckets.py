import os, sys
from pathlib import Path

def get_terraform_paths(parent):
    tf_workspaces = []
    for path in Path(parent).rglob('terraform'):
        for e in path.iterdir():
            #get the name of the directory by returning the path object and partitioning from the right.
            #rpartition returns prefix, delimiter and postfix in a list, so we take the last element as it's the only one we care about.
            tf_workspaces.append(str(e).rpartition('/')[-1]) 
        print(path.name)

#Allow passing of a directory to traverse as the only argument to the command line. Else use the current working directory.
if __name__ == '__main__':
    if len(sys.argv > 1):
        get_terraform_paths(sys.argv[1])
    else:
        get_terraform_paths(os.getcwd())