puts "What repos would you like to clone from Github?"
puts "(ex: rails/rails, listen360/legacy_dashboards)"
repos = gets.chomp

repo_list = repos.split(', ')

@home_dir = Dir.home

def clone(repo_list)
  set_working_dir
  repo_list.each do |repo|
    puts `git clone git@github.com:#{repo}.git`
  end
end

def set_working_dir
  puts 'Please enter the directory you will be working from.'
  puts '(this folder should live inside your Home folder'
  @working_dir = gets.chomp

  if Dir.exists?("#{@home_dir}/#{@working_dir}")
    Dir.chdir("#{@home_dir}/#{@working_dir}")
  else
    create_working_directory(@working_dir)
    Dir.chdir("#{@home_dir}/#{@working_dir}")
  end
end

def create_working_directory(working_dir)
  printf "\033[31mDirectory doesn't exist. Would you like to create it? Please type yes or no: \033[0m"
  create_dir = STDIN.gets.chomp
  if create_dir == 'yes'
    Dir.mkdir(File.join(Dir.home, working_dir), 0700)
  else
    puts "You can manually create the folder you wish to use and execute this script again."
    exit
  end
end

clone(repo_list)
