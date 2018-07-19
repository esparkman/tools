Dir.foreach(ARGV[0]) do |file|
  next if file == '.' or file == '..' or file == '.DS_Store'

  filename = "#{Dir.pwd}/#{ARGV[0]}/#{file}"
  # TODO: Make this more deterministic on OS
  # If running on Linux this should run ack-grep
  system("ack -i #{ARGV[1]} #{filename} > #{Dir.home}/logs/#{file}_results_#{ARGV[1]}.txt")
end
