@echo off
color 04
title GitHub Commit Cleaner

:retry
set "input="
set /p input="commit-clean>

IF "%input%"=="exit" (
  exit
) ELSE IF "%input%"=="help" (
  goto :help
) ELSE IF "%input%"=="clear" (
  goto :clear
) ELSE IF "%input%"=="cmd" (
  goto :cmd
) ELSE (
  cd %input%
  git checkout --orphan latest_branch
  git add -A
  git commit -am "commit message"
  git branch -D master
  git branch -m master
  git push -f origin master
  cd ..
  goto :retry
)

:help
echo 'clear' = Clear screen.
echo 'cmd' = Launch CMD.
echo 'exit' = Exit application.
echo 'help' = View more commands.
echo 'repository name' = Clean repo commits.
echo:
goto :retry

:clear
cls
goto :retry

:cmd
cmd
echo:
goto :retry
