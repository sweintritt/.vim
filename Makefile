.PHONY: install-vundle
install-vundle: ## Installs the Vundle plugin manager:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

.PHONY: install
install: ## Changes the .vimrc to source vimrc.vim. Any existing file will be stored as ~/.vimrc.old
	@if [ -f ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc.old; fi
	@echo ":source ~/.vim/vimrc.vim" > ~/.vimrc

.PHONY: help
help: ## Shows the help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }'

README.md: ## Generates the README.md file
	@echo ".vim" > $@
	@echo "=====" >> $@
	@echo "" >> $@
	@echo "My vim dot files. the '.vimrc' file is saved to [vimrc](https://github.com/sweintritt/.vim/blob/master/vimrc)." >> $@
	@echo "" >> $@
	@echo "# Installation" >> $@
	@echo "" >> $@
	@echo "Just run the following commands via terminal to get perfectly set up:" >> $@
	@echo "" >> $@
	@echo "\`\`\`console" >> $@
	@echo "$$ cd ~/" >> $@
	@echo "$$ git clone https://github.com/sweintritt/.vim.git .vim" >> $@
	@echo "$$ cd .vim" >> $@
	@echo "$ make install" >> $@
	@echo "# Start vim and run :PluginInstall" >> $@
	@echo "\`\`\`" >> $@
	@echo "" >> $@
	@echo "You will also want [Powerline Fonts](https://github.com/powerline/fonts)." >> $@
	@echo "" >> $@
	@echo "# The \`Makefile\`" >> $@
	@echo "" >> $@
	@echo "The [\`Makefile\`](Makefile) gives you a few commands to help with the installation." >> $@
	@echo "" >> $@
	@echo "\`\`\`console" >> $@
	@echo "$ make help" >> $@
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN { FS = ":.*?## " }; { printf "%-20s %s\n", $$1, $$2 }' >> $@
	@echo "\`\`\`" >> $@
	@echo "" >> $@
	@echo "# Used plugins" >> $@
	@echo "" >> $@
	@grep Plugin plugins.vim | awk -F"'" '{ print "["$$2"](https://github.com/"$$2")" }' >> $@
	@echo "" >> $@
