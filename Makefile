.PHONY: run  install

run: install
	bundle exec jekyll build 
	bundle exec jekyll serve 

install: 
	bundle install 
