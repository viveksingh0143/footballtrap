root = "/home/vamika/apps/footballtrap/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_footballtrap.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.footballtrap.sock"
worker_processes 2
timeout 30
