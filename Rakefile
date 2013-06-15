require 'rake'

desc "Remove bash_profile and bashrc"
task :cleanup do

  files = ["#{ENV['HOME']}/.bash_profile", "#{ENV['HOME']}/.bashrc"]

  files.each do |f|
    if File.exist?(f)
      run %{ rm #{f} }, "Deleting"  if want_to_remove?("#{f}")
    end
  end

end

desc "Install dotfiles ."
task :install => [:submodules] do

  @oh_my_zsh = "$HOME/.oh-my-zsh"

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables = []
  linkables += Dir.glob('git/*') if want_to_install?('git')
  linkables += Dir.glob('ruby/*') if want_to_install?('ruby (gems)')
  linkables += Dir.glob('irb/*') if want_to_install?('irb/pry')
  linkables += Dir.glob('autotest/*') if want_to_install?('autotest')
  linkables += Dir.glob('ctags/*') if want_to_install?('ctags config (better js/ruby support)')
  linkables += Dir.glob('{vim,vimrc}') if want_to_install?('vim')
  linkables += Dir.glob('zsh/zshrc') if want_to_install?('zsh')
  linkables += Dir.glob('aliases/*') if want_to_install?('aliases for git and other stuff')
  linkables += Dir.glob('vimify/*') if want_to_install?('vimification of mysql/irb/command line')
  linkables += Dir.glob('slate') if want_to_install?('slate')

  Rake::Task['zsh_themes'].invoke

  linkables.each do |linkable|
    file = linkable.split('/').last
    source = "#{ENV["PWD"]}/#{linkable}"
    target = "#{ENV["HOME"]}/.#{file}"

    p "--------"
    p "file: #{file}"
    p "source: #{source}"
    p "target: #{target}"

    check_dotfile(file, target)
    run %{ ln -s "#{source}" "#{target}" }
  end

  success_msg("installed")
end

task :zsh_themes do
  if File.exist?("#{ENV['HOME']}/.oh-my-zsh/modules/prompt/functions")
    puts "Detected prezto (oh-my-zsh @sorin-ionescu)."
    run %{ ln -nfs #{ENV["PWD"]}/oh-my-zsh/modules/prompt/functions/* $HOME/.oh-my-zsh/modules/prompt/functions/ } if want_to_install?('zsh themes')
  elsif File.exist?("#{ENV['HOME']}/.oh-my-zsh")
    puts "Detected oh-my-zsh @robbyrussell."
    run %{ ln -nfs #{ENV["PWD"]}/oh-my-zsh/themes/* $HOME/.oh-my-zsh/themes/ } if want_to_install?('zsh themes')
  end
end

desc "Init and update submodules."
task :submodules do
  sh('git submodule update --init')
end

task :default => 'install'

private

def copy_dotfile(file, directory)
  unless File.exists?(file) || File.symlink?(file)
    run %{ cp "#{file} #{directory}" }
    p "--------"
    p "copying file #{file} to #{directory}"
  else
    p "--------"
    p "#{file} exists in #{directory}. rm #{directory}/#{file} if you want to replace. "
  end
end

def check_dotfile(file, target)
  skip_all ||= false
  overwrite_all ||= false
  backup_all ||= false

  if File.exists?(target) || File.symlink?(target)
    unless skip_all || overwrite_all || backup_all
      p "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
      case STDIN.gets.chomp
      when 'o' then overwrite = true
      when 'b' then backup = true
      when 'O' then overwrite_all = true
      when 'B' then backup_all = true
      when 'S' then skip_all = true
      end
    end
    FileUtils.rm_rf(target) if overwrite || overwrite_all
    run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" } if backup || backup_all
  end
end

def run(cmd, action="[Installing]")
  p "#{action} #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def want_to_install? (section)
  p "Would you like to install configuration files for: #{section}? [y]es, [n]o"
  STDIN.gets.chomp == 'y'
end

def want_to_remove? (file)
  p "Would you like to remove the file: #{file}? [y]es, [n]o"
  STDIN.gets.chomp == 'y'
end

def success_msg(action)
  p "bridgeutopia dotfiles #{action}."
end
