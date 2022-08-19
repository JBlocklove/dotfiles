import sys, os, datetime
from os.path import expanduser

def diff_old(current_local, current_remote, file_type):
    """Diffs current lists for merge with old versions. If anything was deleted it ensures that the deleted item is not in the final list

    :current_local: TODO
    :current_remote: TODO
    :returns: TODO

    """
    home = expanduser("~")
    with open (home + '/.calcurse/script/old_versions/' + file_type) as f:
        old_version = f.readlines()

    for val in old_version:
        if val not in current_local and val in current_remote:
            current_remote.remove(val)
        elif val in current_local and val not in current_remote:
            current_local.remove(val)
        else:
            continue

    total_list = []
    for val in current_local:
        if val not in total_list:
            total_list.append(val)
    for val in current_remote:
        if val not in total_list:
            total_list.append(val)

    return total_list


def merge_todo(file_1, file_2):
    """Merges calcurse todo files

    TODO: Find a way of accounting for deleted todos from either client or server
        idea: store previous merged versions of both, use a diff to find if lines were deleted

    :file_1: list of local todos
    :file_2: list of remote todos
    :returns: total sorted list

    """
    total_list = diff_old(file_1, file_2, 'todo')
    total_list.sort()
    return total_list

def merge_apts(file_1, file_2):
    """Merges calcurse apts file

    :file_1: list of local apts
    :file_2: list of remote apts
    :returns: total sorted list

    """
    total_list = diff_old(file_1, file_2, 'apts')
    total_list.sort(key=lambda x: datetime.datetime.strptime(x[:10], '%m/%d/%Y'))
    return total_list


def main():
    calcurse_dir = expanduser("~/.calcurse/")
    if len(sys.argv) != 2:
        print ("Usage: calcurse_merge.py <server>")
        sys.exit(1)
    else:
        server = sys.argv[1]

    os.system('mkdir -p ' + calcurse_dir + 'script/tmp')
    os.system('cd ' + calcurse_dir + 'script/tmp && scp ' + server + ':~/.calcurse/apts ~/.calcurse/todo .')
    #os.system('scp ' + server + ':~/.calcurse/apts ~/.calcurse/todo .')

    with open(calcurse_dir + 'script/tmp/apts') as f:
        remote_apts = f.readlines()
    with open(calcurse_dir + 'script/tmp/todo') as f:
        remote_todo = f.readlines()
    with open(calcurse_dir + 'apts') as f:
        local_apts = f.readlines()
    with open(calcurse_dir + 'todo') as f:
        local_todo = f.readlines()

    todo_list = merge_todo(local_todo, remote_todo)
    apts_list = merge_apts(local_apts, remote_apts)

    with open(calcurse_dir + 'script/tmp/apts', 'w') as f:
        for item in apts_list:
            f.write(item)

    with open(calcurse_dir + 'script/tmp/todo', 'w') as f:
        for item in todo_list:
            f.write(item)


    os.system('cd ' + calcurse_dir + 'script/tmp && cp apts todo ' + calcurse_dir + 'script/old_versions && scp apts todo ' + server + ':~/.calcurse && cp apts todo ~/.calcurse && cd .. && rm -rf tmp')


if __name__ == "__main__":
    main()
