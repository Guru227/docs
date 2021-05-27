--- week 2 ---

# Git's Graph Model

Git uses a directed acyclic graph where the commits point to their parent commits.
To view the git graph on command line.

		git log --online --graph

# Git IDs (Git Object Names)

## Git Objects

1. Commit object -  a small text file that contains information on the commit (user, reference to parent's commit, reference to root commit, commit message).
2. Annotated tag - reference to a specific commit
3. Tree (inside object store) - list of file names and directories inside of (project) directory.
4. Blob (inside object store)- The content of a file in the project

## Git IDs

- 40 character hexadecimal SHA-1 (Secure Hash Algorithm - 1) value. **Note: ** The SHA-1 values are designed to avalanche - a small change in content causes a drastically different SHA-1 values.
- `plumbing commands`

## Shortening Git IDs (first 4-7 characters)

Unlikely for 2 IDs to have similar first 7 characters. To show contents of the file:

		git show <id/tag-name>

# Git References

Commits can be associated with references (a user-friendly name). If a commit points to another reference, it is called a symbolic reference.

		git show (SHA-1/references)
		
master - default name of main branch
> points to the tip of the branch, current node (commit)
> stored in `.git/heads/master`

HEAD - reference to the current commit
> points to the branch label of the current branch (symbolic reference)
> stored in `.git/HEAD`

## Referencing prior commits using ~ and ^

### Refers to parent's

~ or ~1 = parent
~~ or ~2 = parent's parent (grandparent)

		git show HEAD~~
or

		git show HEAD~2
or

		git show <SHA1>~~

### Refers to different parents in a merge commit

^ / ^1 = commits first parent
^^ / ^2 = commits second parent

		git show HEAD^^
or

		git show HEAD^2
or

		git show <SHA1>^^

**Note:** Read from left-to-right

## Tags

A tag is a reference to a specific commit.

### Types

1. Lightweight - a simple reference to a commit
2. Annotated (recommended) - a full git object (similar to a commit object)

To view tags:

	git tag

To tag with lightweight tag:
	
	git tag <tagname> [<commit>] - if comit not specified, is added to HEAD

To tag with annotated tag:

git tag -a [-m <msg> | -F <file>] <tagname> [<commit>] - commit defaults to HEAD

### Tags and remote repositories

Tags aren't automatically pushed to a remote repo. To push it use:

	git push <remote> --tags
	git push <remote> <tagname>

Tags are also viewed on cloned repositories.
# Branches

## Overview

A branch is a set of commits, starting from the most recent commit, which trace back to the project's first commit. By default, all commits are on the `master` branch.

## Benefits of Branches

1. fast and easy to create - only creation of a simple label
2. enables experimentation without destabilising the main branch
3. Enables team development, allows multiple branches and a final merge
4. Supports multiple project versions simultaneously

## Types of branches

1. Topic (a short-lived branch) 
	- usually involves a feature, a bug fix, a hotfix or a configuration change 
	- usually merged into the master branch
2. Longer than a topic branch, and may even last for the entire life of the project
	- a master branch, a develop branch, or a release branch
	
To view a list of branches in local repository

	git branch

Shows list of branches, with current branch with an asterisk (*).

## Create a branch

	git branch <branch-name> 

Creates a <branch-name> label that points to the current commit.

## Checkout

Related to branches and does 2 main things:

1. Updates the HEAD reference.
2. Updates the working tree with the commit's files.

	git checkout <branch_or_commitSHA1>

Combine Creation and checkout of a branch:

	git checkout -b <branch-name>

**Note: **You can continue development in both the `master` branch and `feature` branch.

## Detached HEAD

A detached head state is when the HEAD label points directly to a commit's SHA-1 value. Git warns you about this. USE: to view commit state. Done by checking out.
To work on it, we need to create a branch label and check out to that commit. then you can continue working on it.

## Deleting a branch label
Deleted after a topic branch has been merged.
	git branch -d <branchname>
	
## Daangling commits

Deleting a branch label without merging the branch. To delete the branch itself, you'll need to use a `-D`.

To restore accidentally deleted labels causing a dangling commit.

	git reflog

Returns a list of recent HEAD commits. you can use the SHA-1 from there to restore branch label.

# Merging