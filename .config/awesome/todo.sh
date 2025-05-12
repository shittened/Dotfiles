#! /bin/bash

echo "Tasks: $(cat Documents/org/tasks/todo.org | grep TODO | wc -l)"
echo "Done: $(cat Documents/org/tasks/todo.org | grep DONE | wc -l)"
