# This is a quite ugly, but working Makefile
# It will find all Makefiles exactly one level below the current directory
# and run them. It uses GNU find to do this.

makefiles := $(shell find . -mindepth 2 -maxdepth 2 -name 'Makefile' -printf "%h\n")

all: $(makefiles)
	@echo Building document via Makefile in $^
	$(foreach dir,$^, $(MAKE) -C $(dir) ;)

cd:
	rm -rf cd
	mkdir cd
	cp -Lrf handin_cd/* cd
	cp -r ../main cd/project

clean: $(makefiles)
	@echo Cleaning via Makefile in $^
	$(foreach dir,$^, $(MAKE) -C $(dir) clean ;)

.PHONY: cd