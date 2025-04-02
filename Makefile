.PHONY: serve
serve: install
	bundle exec jekyll serve

.PHONY: build  
build: install
	bundle exec jekyll build 

.PHONY: install
install: 
	bundle install 

.PHONY: publish
publish: install build
	rsync -avz --delete ./_site/ ionos-second:/var/www/html/