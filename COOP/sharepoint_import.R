
#shaerpoint list id: 0079a236-0e88-406b-8b0c-b6c56c9bd289

cmd <- paste("cd */")
cmd <- paste("cd Users*/lvawter*/Documents*/R_scripts*/workflow*/COOP")
#cmd <- paste("dir")
#cmd <- paste("curl --max-time 7200 --connect-timeout 7200 --ntlm --user", "lvawter@icprb.org:secret",  "--upload-file import_file.xlsx","https://icprb.sharepoint.com/sites/COOP/import/test.xlsx", sep = " ")
system(cmd)


saveToSharePoint <- function(fileName) 
{
  cmd <- paste("curl --max-time 7200 --connect-timeout 7200 --ntlm --user","username:password", 
               "--upload-file", paste0("/home/username/FolderNameWhereTheFileToTransferExists/",fileName), 
               paste0("teamsites.OrganizationName.com/sites/PageTitle/Documents/UserDocumentation/FolderNameWhereTheFileNeedsToBeCopied/",fileName), sep = " ")
  system(cmd)
}

saveToSharePoint("SomeFileName.Ext")

curl --max-time 7200 --connect-timeout 7200 --ntlm --user", "lvawter@icprb.org:secret",  "--upload-file import_file.xlsx","https://icprb.sharepoint.com/sites/COOP/import/import_file.xlsx", sep = "

curl --max-time 7200 --connect-timeout 7200 --ntlm", "--upload-file import_file.xlsx","C:\Users\lvawter\Documents\R_scripts\workflow\test", sep = "

curl --max-time 7200 --connect-timeout 7200 --ntlm --user "lvawter@icprb.org:secret" --header "Content-Type: text/csv" --request POST --data-binary "import_file.csv" https://icprb.sharepoint.com/sites/COOP/import_file.csv

curl --max-time 7200 --connect-timeout 7200 --ntlm --user "lvawter@icprb.org:secret" --header "Content-Type: text/csv" --upload-file "import_file.csv" https://icprb.sharepoint.com/sites/COOP/import_file.csv

curl --max-time 7200 --connect-timeout 7200 --ntlm --user "lvawter@icprb.org:secret" --upload-file "import_file.csv" https://icprb.sharepoint.com/sites/COOP/Documents/import/import_file.csv


9.940000000000001