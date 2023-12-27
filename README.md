# dotfiles with GNU/Stow

A collection of configuration files for a *nix-like OS intended for
use with the [GNU/Stow](https://www.gnu.org/software/stow/manual/stow.html).

## Installation

On the "old" machine: 

0. Prepare an archive with private repos not included to the git index:

```shell
make archive
```

On the "new" machine (from this step onward):

1. Install GNU/Stow:

- Fedora Linux:

```shell
sudo dnf install -y stow
```

- MacOS with homebrew:

```shell
brew install stow
```

2. Clone the repo:

```shell
git clone --recurse-submodules git@github.com:pilosus/dotfiles.git
```

3. Unpack the archive from the step 0:

```shell
cd dotfiles
cp ~/Downloads/archive.tar.gz .
tar xzf --keep-newer-files archive.tar.gz
rm archive.tar.gz
```
Alternatively, instead of step 2, re-create `dotfiles` repo from the archive:

- Create `mkdir dotfiles`
- Follow step 3
- Clone and init submodules with:

```shell
make clone
make submodule
```

## Stow Manual

### Definitions

A *stow directory* is a root directory of this repo, containing all the packages.

A *package* is directory in a stow directory containing all the
necessary files and direcotories to be installed into a target
directory.

A *target directory* is a directory the packages will be installed
into via the symlink creation.

*Installing* or *stowing* is a process of a symlink creation, when
content of the package directory get symlinked to a target directory.

*Deletion* or *unstowing* is a process of removing symlinks.

### Packaging

To create a package, create a directory in the stow directory with the
proper files and directories layout that is expected to be installed
to the target directory.

E.g. these directories in the root of the repo are packages:

```shell
tree
.
├── bash
├── clojure
├── emacs
├── gpg
├── pypi
└── ssh
```

### Package as a git-submodule

Some packages are stand-alone repos. These can be installed using
[git-submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules). E.g. let's
create a `clojure` package from the
[dot-clojure](https://github.com/pilosus/dot-clojure) repo:

```shell
pwd
your-stow-directory

git submodule add git@github.com:pilosus/dot-clojure.git clojure/.clojure
```

The new submodule is added to the `.gitmodules` file as well to the
`~/.git/config`. In the submodule directory do the things needed,
e.g. pull the updates:

```shell
cd .clojure
git pull
```

NB! Converting existing directory to a submodule
[discussion](https://stackoverflow.com/questions/36386667/how-to-make-an-existing-directory-within-a-git-repository-a-git-submodule)

### Cloning the repo

To clone the repo along with the submodules, use
`--recurse-submodules` option to `git clone`:

```shell
git clone --recurse-submodules https://github.com/pilosus/dotfiles
```

### Usage

See [manual](https://www.gnu.org/software/stow/manual/stow.html) for
definitions, usage examples and more.

#### Stowing: creating symlinks for a package

```shell
stow --target=$HOME ansible
```

#### Unstowing: removing symlimks for a package

```shell
stow --target=$HOME --delete ansible/
```

#### Bulk operations: stow, unstow

Stow all packages at once, pruning obsolete symlinks:

```shell
stow --verbose --target=$HOME --restow */
```

or simply:

```shell
make stow
```

Unstow all the packages:

```shell
stow --verbose --target=$HOME --delete */
```

or simply:

```shell
make unstow
```

#### Prepare archive with the secret repos

When moving files to a new machine, create an archive with:

```shell
make archive
```
