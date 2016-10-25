$log_counter = 1
def general_log(message)
  print "its #{message} now "
  $log_counter.times { print "."}
  print "\n"
  $log_counter += 1

  if $log_counter == 15
    $log_counter = 1
  end
end