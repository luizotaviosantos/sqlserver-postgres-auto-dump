$database_type = Read-Host “Please specify the type of database: [sqlserver, postgres]”

switch ($database_type) {
    'sqlserver' {
        $destination_server = Read-Host “Please provide the server hostname for the dump:”
        $database_name = Read-Host “Please specify the database name:”
        Invoke-Sqlcmd -ServerInstance $destination_server -Database $database_name -Query “BACKUP DATABASE [$database_name] TO DISK” 
    } 
    'postgres' {
        $destination_server = Read-Host “Please provide the server hostname for the dump:”
        $database_name = Read-Host “Please specify the database name:”
        Invoke-Sqlcmd -ServerInstance $destination_server -Database $database_name -Query “pg_dump [$database_name] -Fc > [$database_name].sql” 
    }
}
