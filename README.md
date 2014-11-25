# Mockup for Developer Space Repository of AT-Components

The mockup uses [Zurb Foundation](http://foundation.zurb.com/) and is realized with [DocPad](https://github.com/bevry/docpad).

The static mockup without dynamic search results, you can find [here](http://deinhofer.github.io/zurb-foundation.docpad/)
To be able to use the dynamic search feature and edit content, layout and style please install docpad and run the project.

## Getting Started

1. [Install DocPad on Ubuntu]
	``` bash
	sudo apt-get update && sudo apt-get install curl build-essential openssl libssl-dev git python
	
	 git clone git://github.com/creationix/nvm.git ~/.nvm
	 printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bashrc
	 NVM_DIR=~/.nvm
	 source ~/.nvm/nvm.sh
	 
	 nvm install v0.10.24
 	 nvm alias default 0.10
 	 nvm use 0.10
 	 
 	 npm install -g npm; npm install -g docpad@6.57.3
	```
2. Clone the project and run the server

	``` bash
	git clone https://github.com/deinhofer/zurb-foundation.docpad
	cd zurb-foundation.docpad
	docpad run
	```

3. [Open http://localhost:9778/](http://localhost:9778/)

4. Start hacking away by modifying the `src` directory

5. Already installed [docpages-plugin-ghpages](https://github.com/docpad/docpad-plugin-ghpages) for easy publishing to github pages. See the link for how to publish. 
## Boring Legal Stuff
The core of the mockup is forked from [ClearSky zurb skeleton](https://github.com/Clearskyabove/zurb-foundation.docpad) the original licenses are:
Unless stated otherwise, all content is licensed under the [Creative Commons Attribution License](http://creativecommons.org/licenses/by/3.0/) and code licensed under the [MIT License](http://creativecommons.org/licenses/MIT/), © [ClearSkyABove](http://clearskyabove.com)
