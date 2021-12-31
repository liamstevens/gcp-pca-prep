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

def update_bucket_workspace(paths,path='gcs/terraform/tf_state_buckets/my.tfvars'):
    f = open(path, 'r')
    tfvars = f.readlines()
    f.close()
    plist = []
    for var in tfvars:
        if 'tf_buckets' in var:
            plist = list(var.rpartition('=')[-1].strip())
            for p in paths:
                if p not in plist:
                    plist.append(p)
                    var = 'tf_buckets = '+str(plist)
    #Now write back the contents of the file plus the changes. this is really lazy and should be reworked at some point but is also not likely to be super slow.
    f = open(path, 'w')
    for var in tfvars:
        f.write(var)
            


#Allow passing of a directory to traverse as the only argument to the command line. Else use the current working directory.
if __name__ == '__main__':
    if len(sys.argv > 1):
        get_terraform_paths(sys.argv[1])
    else:
        get_terraform_paths(os.getcwd())