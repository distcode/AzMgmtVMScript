function Get-DISTAzVMPubIP {
    [CmdletBinding(DefaultParameterSetName = 'PipelineUsed')]
    param (
        [Parameter(ValueFromPipeline = $true, ParameterSetName = 'PipelineUsed')]
        [Microsoft.Azure.Commands.Compute.Models.PSVirtualMachine[]]
        $VM = @(),

        [Parameter(Mandatory = $true, ParameterSetName = 'ParametersUsed')]
        [String]
        $ResourceGroupName,

        [Parameter(ValueFromPipeline = $true, ParameterSetName = 'ParametersUsed')]
        [String[]]
        $VMName
    )


    BEGIN {
        
        class distAzVMInfo {
            [string]$VMName
            [string]$PublicIP
            [Microsoft.Azure.Commands.Compute.Models.PSVirtualMachine]$VM

            distAzVMInfo() {

            }

            distAzVMInfo([Microsoft.Azure.Commands.Compute.Models.PSVirtualMachine]$VM, [string]$PublicIP) {
                $this.PublicIP = $PublicIP
                $this.VM = $VM
                $this.VMName = $VM.Name
            }
        }
        function Get-PubIPAddressOfSingelVM {
            [CmdletBinding()]
            param (
                [Parameter(Mandatory = $true)]
                [String]
                $VMName,
    
                [Parameter(Mandatory = $true)]
                [String]
                $ResourceGroupName
            )

            $vm = Get-AzVm -ResourceGroupName $ResourceGroupName -Name $VMName
            $nic = Get-AzNetworkInterface -ResourceId $vm.NetworkProfile.NetworkInterfaces.Id
            $pubIPResource = Get-AzPublicIpAddress | Where-Object { $_.Id -eq $nic.IpConfigurations.publicIpAddress.Id }
            $pubIP = $pubIPResource.IpAddress

            $result = [distAzVMInfo]::New($vm, $pubIP)

            return $result
        }
        
        $result = @()
    }

    PROCESS {
        if ( $VM.Count -eq 0 ) {
            foreach ( $tempVMName in $VMName ) {
                $result += Get-PubIPAddressOfSingelVM -VMName $tempVMName -ResourceGroupName $ResourceGroupName
            }
        }
        else {
            foreach ( $tempVM in $VM ) {
                $result += Get-PubIPAddressOfSingelVM -VMName $tempVM.name -ResourceGroupName $tempVM.ResourceGroupName  
            }
        }
    }

    END {
        $result
    }

}