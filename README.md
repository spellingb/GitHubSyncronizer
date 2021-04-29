# RXT-GITHUB-SYNC

## Introduction

This is a Simple script used to keep repos in sync between GitHub.com and Enterprise Github.
## Getting started

1.  [Download](https://github.com/spellingb/GitHubSyncronizer/releases) the package to your computer
2. Unzip to your preferred location.
2. Rename *SAMPLE.config.json* to *config.json*
3. configure the config.json with your Repo locations
4. Run the script, specifying your sync direction.


## Code Samples


```powershell
.\Sync.ps1 -SyncDirection git2ent
```

Output:
```
VERBOSE: Origin: https://EnterpriseGitHub.Contoso.com/spellingb/GitHubSyncronizer.git
VERBOSE: Secondary: https://github.com/spellingb/GitHubSyncronizer.git
Cloning into bare repository 'GitHubSyncronizer.git'...
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
From https://EnterpriseGitHub.Contoso.com/spellingb/GitHubSyncronizer.git
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

## Config Samples
```json
{
    "EnterpriseRepo": "https://EnterpriseGitHub.Contoso.com/spellingb/GitHubSyncronizer.git",
    "GitHubRepo": "https://github.com/spellingb/GitHubSyncronizer.git",
    "Primary": "Enterprise"
}
```

## Troubleshooting
+ Error when syncing
```powershell
PS C:\github\RXT-GITHUB-Sync> .\Sync.ps1 -SyncDirection git2ent -Verbose
...
...
...
POST git-upload-pack (126 bytes)
From https://EnterpriseGitHub.Contoso.com/spellingb/GitHubSyncronizer.git
 = [up to date]      master     -> master
Pushing to https://github.com/spellingb/GitHubSyncronizer.git
To https://github.com/spellingb/GitHubSyncronizer.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/spellingb/GitHubSyncronizer.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
***This occurs when the repo source repo ( in this case, the git repo) is not latest.(i.e. the ent repo is the latest in my example.
The solution here is to sync in the opposite direction.***
</br>***If Syncing in the other direction does not work, then both repos have changes that need to be synced. I havn't yet added in this feature.***

## Installation

