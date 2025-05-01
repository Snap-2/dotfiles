install:
	rm -rf ~/.config/alacritty
	rm -rf ~/.config/nvim
	rm -f ~/.bashrc
	cp -r alacritty ~/.config/alacritty
	cp -r nvim ~/.config/nvim
	cp .bashrc ~/.bashrc

update:
	rm -rf alacritty
	rm -rf nvim
	rm -f .bashrc
	cp -r ~/.config/alacritty alacritty
	cp -r ~/.config/nvim nvim
	cp ~/.bashrc .bashrc
