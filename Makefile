interactive_test:
	@docker build . -t aukan_dotfiles
	@docker run --rm -it aukan_dotfiles

test:
	@docker build . -t aukan_dotfiles
	@docker run --rm aukan_dotfiles

