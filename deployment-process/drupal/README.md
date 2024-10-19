# Drupal

update `disable_function` to secure php. We need to configure php.ini file `vim /etc/php/5.6/apache2/php.ini`

```shell
open_basedir = /var/www/directored_cluster:/tmp
disable_functions = pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,exec,passthru,system,shell_exec,popen,proc_open,pcntl_exec,lynx,lwp-mirror,eval,getcwd,chdir,php_uname,posix_getegid,get_current_user,curl_version,mysql_get_client_info,imap_open,Posix_getpwuid,file,actionFilesMan,wsoSecParam,actionBruteforce,actionInfect,actionSecInfo,ListFiles,hardScandir,actionFilesTools,rename,touch
```
