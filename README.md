#bridgeutopia dotfiles

## Disclaimer

<strong> This is not the perfect setting. I think that every programmer
should have different dotfiles and use what works for him/her. Dotfiles usually vary based on languages used
and tools used everyday apart from personal preferences. This might work well for others who use Ruby, Lua, Javascript, HTML5 and C. </strong>

#Install

<strong> Given homebrew, git, oh-my-zsh and some dependencies except for vundle is installed.</strong>

	git clone https://github.com/bridgeutopia/dotfiles.git ~/.dotfiles

	rake install #Choose B to create a backup of your previous dotfiles
	rake cleanup #if you want to remove all the bash files

	#Ignore the unknown function errors
	#Install vundle
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

	mvim .
	:BundleInstall

	Install the fonts. See fonts ~/.dotfiles/fonts

## Update

	cd  ~/.dotfiles && git pull origin master
	rake submodules #update some submodules
	:BundleInstall! #update vundles / vim plugins


## Custom config

	~/.dotfiles/custom/directories #aliases for directories


# Dependencies


## <a href="https://github.com/mxcl/homebrew/" target="_blank">Homebrew</a>


	/usr/bin/ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)


### Install dependencies via homebrew

	brew install ack ctags git hub macvim

## <a href="https://github.com/robbyrussell/oh-my-zsh" target="_blank">oh-my-zsh</a>

<strong> I used to use .bash_profile and it was very cluttered. Now it's pretty much a blank file. This is a lot better. And I've organized everything into several different files under .dotfiles directory.</strong>

	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


## <a href="https://github.com/gmarik/vundle" target="_blank">Vundle</a>

<strong> You should use Vundle rather than track and/or maintain plugins yourself. </strong>

	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## Install vim plugins

	mvim .
  	:BundleInstall


## <a href="https://rvm.io/" target="_blank">RVM</a>

<strong> For Ruby version management, I still prefer RVM over rbenv. </strong>

	curl -L https://get.rvm.io | bash -s stable --ruby


## <a href="https://github.com/pry/pry/" target="_blank">Pry</a>
<strong> Goodbye, ruby-debug ? </strong>

	gem install pry
	gem install pry-nav
	gem install awesome_print

# Aliases

<strong> There's a lot of aliases (shorter versions of existing commands) <a href="https://github.com/bridgeutopia/dotfiles/blob/master/aliases/aliases" target="_blank">here.</a> Take time to read. </strong>

	ar #alias reload
	ae #edit aliases


## Acknowledgement

This project is maintained by  <a href="http://blog.bridgeutopiaweb.com" target="_blank">Katherine G. Pe</a></strong>

## Credits & Resources

*   <a href="https://github.com/skwp/dotfiles/" target="_blank">YADR</a>
*   <a href="https://peepcode.com/products/advanced-command-line/" target="_blank">Peepcode Advanced Command line</a>

