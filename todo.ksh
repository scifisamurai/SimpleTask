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
      ;;
    'D')
      token='D'
      ;;
    'I')
      token='I'
      ;;
    'A')
      token='A'
        awk 'gsub("^T", "<Todo>\t\t") gsub("^D", "<Done>\t\t") gsub("^I", "<In Progress>\t")' ${TASKFILE}|cat -n
      ;;
     *)
      token='Other'
      ;;
  esac 

  #Process the file
  if [ $token != "A" -a $token != "Other" ] ; then
        grep -i "^${token}" ${TASKFILE}|cut -d "${token}" -f 2-|cat -n
  fi

}

#Display user menu
function showMenu {

    print  "1. New Task\n2. Update Existing Task\n3. List Existing Tasks\n4. Quit\n"

    read iMenuOption
    echo $iMenuOption
    if [ $iMenuOption -ne '4' ] ; then
      getMenuOption
    fi
    return $iMenuOption
}

function getMenuOption {

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
     #'4')
     #   exit
     #   ;;
      *)
       echo "invalid option"
       ;;
    esac
}


   until [ $? -eq '4' ] ; do
      showMenu
   done
