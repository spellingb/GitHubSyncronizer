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
.\Sync.ps1 -SyncDirection git2ent
```

Output:
```

Cloning into bare repository 'SANIZED.git'...
POST git-upload-pack (146 bytes)
POST git-upload-pack (390 bytes)
remote: Enumerating objects: 70, done.
remote: Counting objects: 100% (70/70), done.
remote: Compressing objects: 100% (44/44), done.
remote: Total 70 (delta 27), reused 63 (delta 20), pack-reused 0R
Receiving objects: 100% (70/70), 22.63 KiB | 1007.00 KiB/s, done.
Resolving deltas: 100% (27/27), done.
Confirm
Are you sure you want to perform this action?
Performing the operation "Sync Repos:" on target "GitHub --> Enterprise".
[Y] Yes [A] Yes to All [N] No [L] No to All [S] Suspend [?] Help (default is "Yes"):
POST git-upload-pack (148 bytes)
From https://github.com/spellingb/SANIZED
 = [up to date]      Port-Initial-Functions -> Port-Initial-Functions
 = [up to date]      master                 -> master
 = [up to date]      origin/Port-Initial-Functions -> origin/Port-Initial-Functions
 = [up to date]      origin/master          -> origin/master
 = [up to date]      v0.1.0                 -> v0.1.0
Pushing to https://github.rackspace.com/gts-armor/SANIZED.git
To https://github.rackspace.com/gts-armor/SANIZED.git
 = [up to date]      Port-Initial-Functions -> Port-Initial-Functions
 = [up to date]      master -> master
 = [up to date]      origin/Port-Initial-Functions -> origin/Port-Initial-Functions
 = [up to date]      origin/master -> origin/master
 = [up to date]      v0.1.0 -> v0.1.0
updating local tracking ref 'refs/heads/Port-Initial-Functions'
updating local tracking ref 'refs/heads/master'
updating local tracking ref 'refs/remotes/origin/Port-Initial-Functions'
updating local tracking ref 'refs/remotes/origin/master'
updating local tracking ref 'refs/tags/v0.1.0'
Everything up-to-date

```


## Installation

