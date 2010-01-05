#!/usr/bin/env ksh

TASKFILE=$HOME/.todo.txt

function newTask {
  echo -n ">"
  read task
  echo T $task >> ${TASKFILE}
}

function listTasks {
  echo "What kind of task would you like to see?"
  echo "ToDo(T), Done(D), In Progress(I), or All(A)" 
  read taskType

  case "$taskType" in
    'T')
      token='T'
        #cat ${TASKFILE}|grep -i '^T' |awk '{print $2}'
        grep -i "^${token}" ${TASKFILE}|cut -d "${token}" -f 2-|cat -n
      ;;
    'D')
      token='D'
        grep -i "^${token}" ${TASKFILE}|cut -d "${token}" -f 2-|cat -n
      ;;
    'I')
      token='I'
        grep -i "^${token}" ${TASKFILE}|cut -d "${token}" -f 2-|cat -n
      ;;
    'A')
        #cut -b 3- ${TASKFILE}|cat -n
        awk 'gsub("^T", "<Todo>\t\t") gsub("^D", "<Done>\t\t") gsub("^I", "<In Progress>\t")' ${TASKFILE}|cat -n
      ;;
     *)
      ;;
  esac 
}

print  "1. New Task\n2. Update Existing Task\n3. List Existing Tasks\n"

read iMenuOption
echo $iMenuOption

  case "$iMenuOption" in
    '1')
      echo "Please enter your new task"
      newTask
      ;;
    '2')
      #Update Existing Task
      echo "Not implemented yet"
      ;;
    '3')
      #echo "list tasks"
      listTasks
      ;;
     *)
      echo "invalid option"
      ;;
  esac


