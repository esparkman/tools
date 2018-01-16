repos = ['legacy_dashboard', 'listen360', 'models', 'migrations', 'feedback', 'einstein', 'dashboards', 'api_client']

@home_dir = Dir.home

def clone(repos)
  set_working_dir
  repos.each do |repo|
    puts `git clone git@github.com:listen360/#{repo}.git`
  end
end

def set_working_dir
  puts 'Please enter the directory you will be working from.'
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
  # prompt = STDIN.gets.chomp
  create_dir = STDIN.gets.chomp
  if create_dir == 'yes'
    Dir.mkdir(File.join(Dir.home, working_dir), 0700)
  else
    puts "You can manually create the folder you wish to use and execute this script again."
    exit
  end
end

clone(repos)