$RoleGroupDetails = @()

$Roles = Get-MsolRole

Foreach ($Role in $Roles) {

    $RoleMembers = Get-MsolRoleMember -RoleObjectId $Role.ObjectId

        Foreach ($RoleMember in $RoleMembers) {    

    $RoleGroupDetail = New-Object -TypeName psobject -Property @{
        
        RoleName = $role.name
        UserName = $RoleMember.User
        UserEmail = $RoleMember.EMailAddress
        Licensed = $RoleMember.IsLicensed
        
    }

    $RoleGroupDetails += $RoleGroupDetail

  }

  }

  $RoleGroupDetails | Select RoleName,UserName,UserEmail,Licensed | Export-CSV RolesAndUsers.csv -NoTypeInformation -Append