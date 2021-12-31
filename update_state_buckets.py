import os, sys, ast
from pathlib import Path

def get_terraform_paths(parent):
    tf_workspaces = []
    for path in Path(parent).rglob('terraform'):
        print(str(path))
        for e in path.iterdir():
            if 'tf_state_buckets' not in str(e) and os.path.isdir(e): #ignore the bucket used for managing the state of buckets, else we risk destroying state!
                #get the name of the directory by returning the path object and partitioning from the right.
                #rpartition returns prefix, delimiter and postfix in a list, so we take the last element as it's the only one we care about.
                tf_workspaces.append(str(e).rpartition('/')[-1]) 
    return tf_workspaces

def update_bucket_workspace(paths,path='gcs/terraform/tf_state_buckets/my.tfvars',suffix='gcp-pca-prep'):
    f = open(path, 'r')
    tfvars = f.readlines()
    newvars = []
    f.close()
    plist = []
    for var in tfvars:
        #Modify the contents of the tf_buckets var.
        if 'tf_buckets' in var:
            plist = ast.literal_eval(var.rpartition('=')[-1].strip())
            for p in paths:
                if p+'-'+suffix not in plist:
                    plist.append(p+'-'+suffix)
            newvars.append('tf_buckets = '+str(plist).replace("\'","\"")+'\n')
        #else pass as is.
        else:
            newvars.append(var)
    #Now write back the contents of the file plus the changes. this is really lazy and should be reworked at some point but is also not likely to be super slow.
    f = open(path, 'w')
    for var in newvars:
        print(var)
        f.write(var)
    f.close()
            
#Allow passing of a directory to traverse as the only argument to the command line. Else use the current working directory.
if __name__ == '__main__':
    if len(sys.argv) > 1:
        update_bucket_workspace(get_terraform_paths(sys.argv[1]))
    else:
        update_bucket_workspace(get_terraform_paths(os.getcwd()))