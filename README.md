# RXT-GITHUB-SYNC

## Introduction

This is a Simple script used to keep repos in sync between GitHub.com and Enterprise Github.
## Getting started

1.  Download to your computer
2. Rename *SAMPLE.config.json* to *config.json*
3. configure the config.json with your Repo locations
4. Run the script, specifying your sync direction.


## Code Samples


```powershell
.\Sync.ps1 -SyncDirection ent2git -Verbose
```

Output:
```

VERBOSE: Origin: https://github.rackspace.com/bran6437/RXT-GITHUB-Sync.git
VERBOSE: Secondary: https://github.com/spellingb/GitHubSyncronizer.git
Cloning into bare repository 'RXT-GITHUB-Sync.git'...
POST git-upload-pack (146 bytes)
POST git-upload-pack (190 bytes)
remote: Enumerating objects: 19, done.
remote: Counting objects: 100% (19/19), done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 19 (delta 5), reused 14 (delta 3), pack-reused 0
Receiving objects: 100% (19/19), done.
Resolving deltas: 100% (5/5), done.
Confirm
Are you sure you want to perform this action?
Performing the operation "Sync Repos:" on target "Enterprise --> GitHub".
[Y] Yes [A] Yes to All [N] No [L] No to All [S] Suspend [?] Help (default is "Yes"):
POST git-upload-pack (126 bytes)
From https://github.rackspace.com/bran6437/RXT-GITHUB-Sync
 = [up to date]      master     -> master
Pushing to https://github.com/spellingb/GitHubSyncronizer.git
Enumerating objects: 19, done.
Counting objects: 100% (19/19), done.
Delta compression using up to 8 threads
Compressing objects: 100% (13/13), done.
Writing objects: 100% (19/19), 3.28 KiB | 1.09 MiB/s, done.
Total 19 (delta 5), reused 19 (delta 5), pack-reused 0
POST git-receive-pack (3547 bytes)
remote: Resolving deltas: 100% (5/5), done.
To https://github.com/spellingb/GitHubSyncronizer.git
 * [new branch]      master -> master
updating local tracking ref 'refs/heads/master'

```


## Installation

