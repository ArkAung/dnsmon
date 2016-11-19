#!/bin/bash
node_list_filename="$1"
remote_save_folder="$2"
csvfile="$3"

while read -r planet_node
do
	folder_name=$(echo $planet_node | cut -d "," -f 2)
  	planetlab_node_name=$(echo $planet_node | cut -d "," -f 1)
  	echo "Working on $planetlab_node_name"
 	#ssh -l wpi_dns_malicious -i ~/.ssh/id_rsa $planetlab_node_name "sudo yum --nogpgcheck -y install bind-utils"
	#ssh -l wpi_dns_malicious -i ~/.ssh/id_rsa $planetlab_node_name "sudo yum --nogpgcheck -y install jwhois"
  	#echo "The folder name will be $folder_name"
    echo "Beating up and getting the file back from $planet_node"
    scp wpi_dns_malicious@$planetlab_node_name:~/$remote_save_folder/$csvfile.csv .
    echo "Renaming file"
    mv $csvfile.csv $folder_name.csv
    cat $folder_name.csv >>  details.csv
    #echo "Running code on $planet_node"
    #ssh -l wpi_dns_malicious -i ~/.ssh/id_rsa $planetlab_node_name "cd $remote_save_folder && ./encompasser.sh" &
done < "$node_list_filename"


#sudo yum --nogpgcheck -y install bind-utils
#sudo yum --nogpgcheck -y install jwhois
