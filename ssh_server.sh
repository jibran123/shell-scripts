#Script assumes that all hosts passed as a parameter to it, have the same user and same private key authentication file
hosts=$1
IFS=', ' read -r -a array <<< $hosts
echo "Welcome!! Enter command."
echo "Note: The command will be executed on all the hosts mentioned above."
echo "Use 'sudo' to execute commands which require elevated rights."
echo "Type 'exit' to exit the promt. Thank You."
read text
while [ "$(echo $text | tr '[:upper:]' '[:lower:]')" != "exit" ]
do
  echo "'$text' will be executed on all the hosts mentioned in the parameter."
  for element in "${array[@]}"
  do
    #Adding sleep in order to catch up in case of large amount of data in output
    sleep 2s
    echo "Executing in '$element' host. Output as follows - "
    # Authentication is done via ec2-user, private key authentication file is aws.pem Which is assumed to be common for all the hosts.
  done
  echo "Enter next command. To stop type 'exit'."
  read text
done