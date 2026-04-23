SHELL = /bin/bash
RM = rm -f

GIT_URL = https://github.com/pekohitsuji/$(shell basename $$(pwd)).git
GIT_CHK = git config remote.origin.url
GIT_ADD = git remote add origin $(GIT_URL)

all:
	make -C tcl/8.6

clean:
	find -name "*~" -delete

tags: TAGS
	ctags -R -e

git:
	if [ ! -d .git ] ; then git init ; fi
	git config --local user.name  pekohitsuji
	git config --local user.email kaeru0921@icloud.com
	if [ -z "$$($(GIT_CHK))" ] ; then $(GIT_ADD) ; fi
	@echo "Do folloings:"
	@echo "    git add ."
	@echo "    git commit -m \"first commit\""
	@echo "    git branch -M main"
	@echo "    git push -u origin main"
