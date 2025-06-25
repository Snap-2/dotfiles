install:
	rm -rf ~/.config/alacritty
	rm -rf ~/.config/nvim
	rm -f ~/.bashrc
	rm -f ~/gitswap.sh
	cp -r alacritty ~/.config/alacritty
	cp -r nvim ~/.config/nvim
	cp gitswap.sh ~/gitswap.sh
	cp .bashrc ~/.bashrc
	bash setup-git.sh

update:
	rm -rf alacritty
	rm -rf nvim
	rm -f .bashrc
	rm -f gitswap.sh
	cp -r ~/.config/alacritty alacritty
	cp -r ~/.config/nvim nvim
	cp ~/gitswap.sh gitswap.sh
	cp ~/.bashrc .bashrc
