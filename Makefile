.DEFAULT_GOAL    := black@hole
HOME_DIR         := $(HOME)
DOT_FILES_LN     := .bash_aliases .bash_colors .bash_functions .bashrc .curlrc .dircolors .gitconfig .ideavimrc .inputrc .mutt .muttrc .profile .psqlrc .rtorrent.rc .urlview .wgetrc .xbindkeysrc .xinitrc .Xresources
DOT_FILES_CP     := .xinitrc .bash_variables

define backup_file
	HF="$(HOME_DIR)/$(1)";\
	if [ -f "$${HF}" ] && [ ! -L "$${HF}" ] && [ ! -f "$${HF}.bak" ]; then\
		echo "[+] backup $${HF} to $${HF}.bak";\
		cp "$${HF}" "$${HF}.bak";\
	fi
endef

define create_symlink
	if [ ! -L "$(HOME_DIR)/$(1)" ]; then\
		echo "[+] create symlink $(HOME_DIR)/$(1)";\
		ln -sf -t $(HOME_DIR) $(PWD)/$(1);\
	fi
endef

install: export BIN_DIR="$(HOME_DIR)/bin"
install:
	# bin files
	mkdir -p $(BIN_DIR)
	ln -sf -t $(BIN_DIR) $(PWD)/bin/*
	# dot files
	@for f in $(DOT_FILES_LN); do\
		echo "file: $$f";\
		$(call backup_file,$$f);\
		$(call create_symlink,$$f);\
	done
.PHONY: install
