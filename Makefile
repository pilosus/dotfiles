stow:
	stow --verbose --target=$$HOME --restow */

unstow:
	stow --verbose --target=$$HOME --delete */

# Archive repositories with secrets/credentials that cannot be added to the repo index.
# NB! Archive includes files at HEAD, no git repos preserved!
archive:
	git archive --output=./archive.tar.gz \
	--format=tar HEAD \
	./ansible \
	./aws \
	./gpg \
	./pypi \
	./ssh \
	README.md \
	Makefile \
	.gitignore

# Add submodules; don't forget to init & update
clone:
	git submodule add --force git@github.com:pilosus/dot-bash.git bash
	git submodule add --force git@github.com:pilosus/dot-clojure.git clojure/.clojure
	git submodule add --force git@github.com:pilosus/dot-emacs.git emacs/.emacs.d
	git submodule add --force git@github.com:pilosus/dot-git.git git
	git submodule add --force git@github.com:pilosus/dot-newsboat.git newsboat/.newsboat
	git submodule add --force https://github.com/pyenv/pyenv.git pyenv/.pyenv

submodule:
	git submodule update --init --recursive
